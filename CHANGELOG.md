# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.0.21](https://git.agilicus.com/open-source/dotnet/compare/v0.0.20...v0.0.21) (2020-04-29)


### Bug Fixes

* add real remote_ip and x_request_id to log ([2f0b4c6](https://git.agilicus.com/open-source/dotnet/commit/2f0b4c64474f1253938881f5be0bd6882c1bc26c))

### [0.0.20](https://git.agilicus.com/open-source/dotnet/compare/v0.0.19...v0.0.20) (2020-04-28)


### Bug Fixes

* allow override entry point for hybrid dotnetcore + .net ([93ceec8](https://git.agilicus.com/open-source/dotnet/commit/93ceec8cdc88ea928cae9307c6f615182a1d98c4))
* redirect entrypoint to /dev/null except for stderr ([047a35e](https://git.agilicus.com/open-source/dotnet/commit/047a35e122b8013d4fbf862688dc5228840e02b4))

### [0.0.19](https://git.agilicus.com/open-source/dotnet/compare/v0.0.18...v0.0.19) (2020-04-28)


### Bug Fixes

* add dotnet 4.7.2 ([4a89461](https://git.agilicus.com/open-source/dotnet/commit/4a89461b1e06990a72ea50ad842dba1c7bd4b200))

### [0.0.18](https://git.agilicus.com/open-source/dotnet/compare/v0.0.17...v0.0.18) (2020-04-24)


### Features

* add .net 4.8 support ([1e424eb](https://git.agilicus.com/open-source/dotnet/commit/1e424eb7d85ae0c5127a405c3ad690359556db48))

### [0.0.17](https://git.agilicus.com/open-source/dotnet/compare/v0.0.16...v0.0.17) (2020-03-27)


### Bug Fixes

* add 302 as valid start condition ([1355720](https://git.agilicus.com/open-source/dotnet/commit/135572065f71ed29da2623dedf08239077bd7a1a))

### [0.0.16](https://git.agilicus.com/open-source/dotnet/compare/v0.0.15...v0.0.16) (2020-03-03)


### Bug Fixes

* correct dotnetcore entrypoint ([f6f70cc](https://git.agilicus.com/open-source/dotnet/commit/f6f70cc76de5f445b9378ea02808768bfc91ef79))

### [0.0.15](https://git.agilicus.com/open-source/dotnet/compare/v0.0.14...v0.0.15) (2020-02-25)


### Bug Fixes

* harmonise logging w/ istio proxy ([ea7d15e](https://git.agilicus.com/open-source/dotnet/commit/ea7d15e74f484ac26376f28e2d6eacfa9690fcb7))

### [0.0.14](https://git.agilicus.com/open-source/dotnet/compare/v0.0.13...v0.0.14) (2020-02-22)


### Bug Fixes

* add xls_token from env var XLS_TOKEN ([d9d5cf1](https://git.agilicus.com/open-source/dotnet/commit/d9d5cf12294147c7015b07f2f19f3286fc52d5fe))

### [0.0.13](https://git.agilicus.com/open-source/dotnet/compare/v0.0.12...v0.0.13) (2020-02-22)


### Bug Fixes

* add dns resolver ([5032a7c](https://git.agilicus.com/open-source/dotnet/commit/5032a7c0ddff0b572c03c62171220ccd75bcb10b))

### [0.0.12](https://git.agilicus.com/open-source/dotnet/compare/v0.0.11...v0.0.12) (2020-02-21)


### Bug Fixes

* add 404 as valid condition for e.g. api ([8a4fc3c](https://git.agilicus.com/open-source/dotnet/commit/8a4fc3c3f189ad8399a2bc58fc29947eeaad3eba))

### [0.0.11](https://git.agilicus.com/open-source/dotnet/compare/v0.0.10...v0.0.11) (2020-02-21)


### Bug Fixes

* allow 500 No Application for health check ([7a56d13](https://git.agilicus.com/open-source/dotnet/commit/7a56d135bb860c9c09d03469b0ad30dc331ed6ca))

### [0.0.10](https://git.agilicus.com/open-source/dotnet/compare/v0.0.9...v0.0.10) (2020-02-14)


### Bug Fixes

* correct wrong quote on entry determination ([0fc21c8](https://git.agilicus.com/open-source/dotnet/commit/0fc21c87cf118b653a8388a9b6462b7275a8064a))

### [0.0.9](https://git.agilicus.com/open-source/dotnet/compare/v0.0.8...v0.0.9) (2020-02-12)


### Bug Fixes

* add proxy_max_temp_file_size=0 setting ([3673091](https://git.agilicus.com/open-source/dotnet/commit/36730912f6f3af6cc9d4f664492424bd9fb2f23b)), closes [44#44](https://git.agilicus.com/open-source/44/issues/44)

### [0.0.8](https://git.agilicus.com/open-source/dotnet/compare/v0.0.7...v0.0.8) (2020-02-07)


### Features

* add xml2, auto-find of dotnetcore entry, rules include ([e5e1609](https://git.agilicus.com/open-source/dotnet/commit/e5e16098cdbe6493841b6092e9f170778b31ab16))


### Bug Fixes

* add missing file ([2b34584](https://git.agilicus.com/open-source/dotnet/commit/2b34584479c7e8a8da6072be44b454978101a49f))

### [0.0.7](https://git.agilicus.com/open-source/dotnet/compare/v0.0.6...v0.0.7) (2020-02-02)


### Features

* add http and jwt libraries ([bcfa541](https://git.agilicus.com/open-source/dotnet/commit/bcfa541cffd1b39589af7b6fb96d8e0c61290199))

### [0.0.6](https://git.agilicus.com/open-source/dotnet/compare/v0.0.5...v0.0.6) (2020-02-01)


### Bug Fixes

* remove run-time ngen ([0eb534b](https://git.agilicus.com/open-source/dotnet/commit/0eb534b4fcf369605ce8d612fe924bb7d68f793b))

### [0.0.5](https://git.agilicus.com/open-source/dotnet/compare/v0.0.4...v0.0.5) (2020-02-01)


### Bug Fixes

* build 3 indep images ([99f30b0](https://git.agilicus.com/open-source/dotnet/commit/99f30b0b1c37cea9af86f95c4ca7e0472be5f0ff))

### [0.0.4](https://git.agilicus.com/open-source/dotnet/compare/v0.0.3...v0.0.4) (2020-01-31)


### Bug Fixes

* re-set secure cookies on / ([b9e55d8](https://git.agilicus.com/open-source/dotnet/commit/b9e55d84cbdac4fe3dab7b71aec19bc53430dfbd))

### [0.0.3](https://git.agilicus.com/open-source/dotnet/compare/v0.0.2...v0.0.3) (2020-01-31)


### Features

* if x-forwarded-proto is http, force all cookies to secure ([baea96e](https://git.agilicus.com/open-source/dotnet/commit/baea96ecb54621f0631cb0e34469a073d08d3cd8))


### Bug Fixes

* incorrect comment in lua ([92375bb](https://git.agilicus.com/open-source/dotnet/commit/92375bba25cea266dd6a6f65600fbc55e31fda1f))

### [0.0.2](https://git.agilicus.com/open-source/dotnet/compare/v0.0.1...v0.0.2) (2020-01-30)


### Bug Fixes

* add setting of content-security-policy from env-var ([e6618a2](https://git.agilicus.com/open-source/dotnet/commit/e6618a2c9df32b61bed192938694debe7ac53173))

### [0.0.1](https://git.agilicus.com/open-source/dotnet/compare/v0.0.0...v0.0.1) (2020-01-16)
