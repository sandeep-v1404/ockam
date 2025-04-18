defmodule Ockam.Transport.TCP.Client do
  @moduledoc false
  use Ockam.Worker

  alias Ockam.Message
  alias Ockam.Wire

  require Logger

  # TODO: modify this for tcp
  @wire_encoder_decoder Wire.Binary.V2

  @impl true
  def address_prefix(_options), do: "TCP_C_"

  @impl true
  def setup(options, state) do
    {host, port} = Keyword.fetch!(options, :destination)
    heartbeat = Keyword.get(options, :heartbeat)

    {protocol, inet_address} =
      case host do
        string when is_binary(string) ->
          {:inet, to_charlist(string)}

        {_, _, _, _} = ipv4 ->
          {:inet, ipv4}

        {_, _, _, _, _, _, _, _} = ipv6 ->
          {:inet6, ipv6}
      end

    # TODO: connect/3 and controlling_process/2 should be in a callback.
    case :gen_tcp.connect(inet_address, port, [
           :binary,
           protocol,
           active: true,
           packet: 2,
           nodelay: true
         ]) do
      {:ok, socket} ->
        :gen_tcp.controlling_process(socket, self())

        state =
          Map.merge(state, %{
            socket: socket,
            inet_address: inet_address,
            port: port,
            heartbeat: heartbeat
          })

        schedule_heartbeat(state)
        {:ok, state}

      {:error, reason} ->
        Logger.error("Error starting TCP client: #{inspect(reason)}")
        ## Return `normal` so the supervisor will not restart it
        ## TODO: solve this with supervision trees instead
        {:error, :normal}
    end
  end

  @impl true
  def handle_info({:tcp, socket, data}, %{socket: socket} = state) do
    case Wire.decode(@wire_encoder_decoder, data) do
      {:ok, message} ->
        forwarded_message = Message.trace_address(message, state.address)
        Ockam.Router.route(forwarded_message)

      {:error, %Wire.DecodeError{} = e} ->
        raise e

      e ->
        raise e
    end

    {:noreply, state}
  end

  def handle_info({:tcp_closed, _}, state) do
    {:stop, :normal, state}
  end

  def handle_info({:tcp_error, _}, state) do
    {:stop, :normal, state}
  end

  def handle_info(:heartbeat, %{socket: socket} = state) do
    case heartbeat_enabled?(state) do
      true ->
        :gen_tcp.send(socket, "")
        schedule_heartbeat(state)

      false ->
        :ok
    end

    {:noreply, state}
  end

  def heartbeat_enabled?(%{heartbeat: heartbeat}) do
    is_integer(heartbeat) and heartbeat > 0
  end

  def schedule_heartbeat(%{heartbeat: heartbeat} = state) do
    case heartbeat_enabled?(state) do
      true ->
        Process.send_after(self(), :heartbeat, heartbeat)

      false ->
        :ok
    end
  end

  ## TODO: implement Worker API
  @impl true
  def handle_message(%{payload: _payload} = message, state) do
    encode_and_send_over_tcp(message, state)
    {:ok, state}
  end

  defp encode_and_send_over_tcp(message, state) do
    forwarded_message = Message.forward(message)

    with {:ok, encoded_message} <- Wire.encode(@wire_encoder_decoder, forwarded_message),
         :ok <- send_over_tcp(encoded_message, state) do
      :ok
    end
  end

  defp send_over_tcp(data, %{socket: socket}) do
    :gen_tcp.send(socket, data)
  end
end
