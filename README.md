# Docker PHP xDebug

PHP with xDebug (for running PHPUnit) for DockerHub.

## Getting Started

This repo contains at least one branch used to auto-build docker images on [DockerHub](https://hub.docker.com/r/intellipharm/php-composer).

* `5.6` -> Builds image `intellipharm/php-xdebug:5.6`
* `7.0` -> Builds image `intellipharm/php-xdebug:7.0`
* `7.1` -> Builds image `intellipharm/php-xdebug:7.1`
* `7.2` -> Builds image `intellipharm/php-xdebug:7.2`
* `7.3` -> Builds image `intellipharm/php-xdebug:7.3`
* `7.4` -> Builds image `intellipharm/php-xdebug:7.4`

## Usage

Build the `xdebug` container by switching to the correct branch, then build and tag based on the current branch

``` shell
docker build -t intellipharm/php-xdebug:${BRANCH} .
```

Run `PHPUnit`

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:7.4 \
./vendor/bin/phpunit
```

Run `PHPUnit` with a different version of PHP

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:5.6 \
./vendor/bin/phpunit
```

Run `PHPUnit` with specific test suites

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:7.4 \
./vendor/bin/phpunit \
--testsuite "Functional,Unit"
```

Run `PHPUnit` with XML log

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:7.4 \
./vendor/bin/phpunit \
--log-junit storage/tests/phpunit-junit.xml
```

Run `PHPUnit` and generate Code Coverage Report

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:7.4 \
./vendor/bin/phpunit \
--coverage-html storage/tests/coverage/html \
--coverage-clover storage/tests/coverage/phpunit-clover.xml
```

Run `PHPUnit` with specific test suites and generate Code Coverage Report

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:7.4 \
./vendor/bin/phpunit \
--testsuite "Functional,Unit" \
--coverage-html storage/tests/coverage/html \
--coverage-clover storage/tests/coverage/phpunit-clover.xml
```

Run `PHPUnit` with specific test suites and generate Code Coverage Report with XML log

``` shell
docker run --rm \
-v ${DIR}/api:/app \
-w /app intellipharm/php-xdebug:7.4 \
./vendor/bin/phpunit \
--testsuite "Functional,Unit" \
--coverage-html storage/tests/coverage/html \
--coverage-clover storage/tests/coverage/phpunit-clover.xml \
--log-junit storage/tests/phpunit-junit.xml
```

Access the `bash` shell

``` shell
docker run -it intellipharm/php-xdebug:7.4 bash
```

Access the `sh` shell

``` shell
docker run -it intellipharm/php-xdebug:7.4 sh
```
