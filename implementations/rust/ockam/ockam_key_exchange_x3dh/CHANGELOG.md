# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.34.0 - 2021-12-13

### Changed

- Vault updates
- Change uses of `ockam_vault_core::Foo` to use `ockam_core::vault::Foo` across crates

## 0.33.0 - 2021-12-06

### Fixed

- Use `Zeroize` on sensitive values in x3dh protocol

### Removed

- Remove symlinks to `DEVELOP.md` and `LICENSE`

## v0.32.0 - 2021-11-22


### Changed

- Run `cargo clippy --fix`

### Fixed

- Fix doc comment for `Initiator` and `Responder`


## v0.31.0 - 2021-11-15
### Changed
- Dependencies updated

## v0.30.0 - 2021-11-08
### Changed
- Dependencies updated
- replace `AsyncTryClone` trait impls with `#[derive(AsyncTryClone)]` wherever applicable

## v0.29.0 - 2021-11-01
### Changed
- Dependencies updated

## v0.28.0 - 2021-10-26
### Changed
- Dependencies updated

## v0.27.0 - 2021-10-25
### Changed
- Fix zeroize usage.
- Make key exchange async.
- Simplified feature usage.
- Move as many things as possible into a workspace.
- Dependencies updated
### Removed
- Remove `None` errors from Error enums.

## v0.26.0 - 2021-10-18
### Changed
- Make credentials optional (disabled by default)
- Dependencies updated

## v0.25.0 - 2021-10-11
### Changed
- Dependencies updated

## v0.24.0 - 2021-10-04
### Changed
- Dependencies updated

## v0.23.0 - 2021-09-27
### Changed
- Dependencies updated

## v0.22.0 - 2021-09-20
### Changed
- Dependencies updated

## v0.21.0 - 2021-09-14
### Changed
- Fixed incorrect link in README

## v0.20.0 - 2021-09-13
### Changed
- Dependencies updated.

## v0.19.0 - 2021-09-03
### Changed
- Dependencies updated.

## v0.18.0 - 2021-08-30
### Changed
- Dependencies updated.

## v0.17.0 - 2021-08-23
### Changed
- Replace std:: modules with core:: and alternate implementations
- Dependencies updated.

## v0.16.0 - 2021-08-16
### Added
- Implement BLS signature using BBS+.
- Introduce Signature Vault type.
### Changed
- Dependencies updated.

## v0.15.0 - 2021-08-09
### Changed
- Dependencies updated.

## v0.14.0 - 2021-08-03
### Changed
- Dependencies updated.

## v0.13.0 - 2021-07-29
### Changed
- Dependencies updated.

## v0.12.0 - 2021-07-26
### Changed
- Dependencies updated.

## v0.11.0 - 2021-07-19
### Changed
- Dependencies updated.

## v0.10.0 - 2021-07-12
### Changed
- Dependencies updated.

## v0.9.0 - 2021-07-06
### Added
- Type for `BLS` secrets.

### Changed
- Dependencies updated.

## v0.8.0 - 2021-06-30
### Changed
- Dependencies updated.

## v0.7.0 - 2021-06-21
### Added
- Added LocalMessage for locally routed messages.
### Changed
- Dependencies updated.

## v0.6.0 - 2021-06-14
### Changed
- Dependencies updated.

## v0.5.0 - 2021-05-30
### Added
### Changed
- Dependency updates.
- Populate key exchange changes.

## v0.4.0 - 2021-05-17
### Added
### Changed
- Dependencies updated.
### Deleted


## v0.3.0 - 2021-05-10
### Added
### Changed
- Dependencies updated.
### Deleted

## v0.2.4 - 2021-05-03
### Changed
- Fix README.

## v0.2.3 - 2021-05-03
### Changed
- Fix crate metadata.

## v0.2.2 - 2021-05-03
### Changed
- Dependencies updated.

## v0.2.1 - 2021-04-26
### Changed
- Dependencies updated.

## v0.2.0 - 2021-04-19
### Changed
- Update X3DH to use VaultWorker.
- Dependencies updated.

## v0.1.4 - 2021-04-14
### Changed
- Build system and test fixes.
- Dependencies updated.

## v0.1.3 - 2021-04-13
### Changed
- Dependencies updated.

## v0.1.2 - 2021-04-12
### Changed
- Dependencies updated.

## v0.1.1 - 2021-04-06
### Changed
- Dependencies updated.

## v0.1.0 - 2021-04-05

- Initial release.
