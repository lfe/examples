# nova-rest

[![Build Status][travis-badge]][travis]
[![LFE Versions][lfe-badge]][lfe]
[![Erlang Versions][erlang-badge]][versions]

[![Project Logo][logo]][logo-large]

*A Nova REST API in  LFE*

##### Table of Contents

* [Build](#build-)
* [Start the Project REPL](#start-the-repl-)
* [Usage](#usage-)
* [License](#license-)


## Build [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe compile
$ rebar3 release
```

# Start the Project REPL [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe repl
```

## Usage [&#x219F;](#table-of-contents)

Once you've built the release and started the REPL (which will bring up the app
in the release), you can access the REST API via `curl`, just like any other
REST service.

Get all pets:

```shell
$ curl --silent \
  http://127.0.0.1:8080/pet | jq .
```

```json
[]
```

Add a pet:

```shell
$ curl --silent \
   -XPOST \
   -H "Content-Type: application/json" \
   -d '{"name": "Spot"}' \
  http://127.0.0.1:8080/pet | jq .
```

```json
{
  "id": "3de41a08-2de0-499a-b3c0-01623b01494d",
  "name": "Spot"
}
```

Get all pets again:

```shell
$ curl --silent \
  http://127.0.0.1:8080/pet | jq .
```

```json
[
  {
    "id": "3de41a08-2de0-499a-b3c0-01623b01494d",
    "name": "Spot"
  }
]
```

Get a specific pet:

```shell
$ curl --silent \
  http://127.0.0.1:8080/pet/3de41a08-2de0-499a-b3c0-01623b01494d | jq .
```

```json
{
  "id": "3de41a08-2de0-499a-b3c0-01623b01494d",
  "name": "Spot"
}
```

Update the pet:

```shell
$ curl --silent \
   -XPUT \
   -H "Content-Type: application/json" \
   -d '{"name": "Spotty"}' \
  http://127.0.0.1:8080/pet/3de41a08-2de0-499a-b3c0-01623b01494d | jq .
```

```json
{
  "id": "3de41a08-2de0-499a-b3c0-01623b01494d",
  "name": "Spotty"
}
```

Delete the pet:

```shell
$ curl --silent \
   -XDELETE \
  http://127.0.0.1:8080/pet/3de41a08-2de0-499a-b3c0-01623b01494d
```

Get all pets again:

```shell
$ curl --silent \
  http://127.0.0.1:8080/pet | jq .
```

```json
[]
```

## License [&#x219F;](#table-of-contents)

Apache License, Version 2.0

Copyright © 2020, Duncan McGreggor <oubiwann@gmail.com>.

<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/3434967?s=250
[logo-large]: https://avatars1.githubusercontent.com/u/3434967
[github]: https://github.com/ORG/nova-rest
[gitlab]: https://gitlab.com/ORG/nova-rest
[travis]: https://travis-ci.org/ORG/nova-rest
[travis-badge]: https://img.shields.io/travis/ORG/nova-rest.svg
[gh-actions-badge]: https://github.com/ORG/nova-rest/workflows/Go/badge.svg
[gh-actions]: https://github.com/ORG/nova-rest/actions
[lfe]: https://github.com/rvirding/lfe
[lfe-badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang-badge]: https://img.shields.io/badge/erlang-19%20to%2023-blue.svg
[versions]: https://github.com/ORG/nova-rest/blob/master/.travis.yml
