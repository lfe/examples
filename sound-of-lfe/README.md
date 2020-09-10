# sound-of-lfe

[![Project Logo][logo]][logo-large]

*An LFE port of 'The Sound of Erlang'*

##### Table of Contents

* [About](#about-)
* [Build](#build-)
* [Usage](#usage-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

This project is an LFE port of [The Sound of Erlang](https://www.erlang-solutions.com/blog/the-sound-of-erlang-how-to-use-erlang-as-an-instrument.html)

Be sure to see that blog post's requirements; this project has the same ones.

## Build [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe compile
$ rebar3 escriptize
```

## Usage [&#x219F;](#table-of-contents)

Play a simple sine wave:


``` shell
$ rebar3 lfe run-escript first
```

Play an A note for 2 seconds:

``` shell
$ rebar3 lfe run-escript a440
```

Play two notes sequentially (a C and G):

``` shell
$ rebar3 lfe run-escript two-notes
```

Run an octave of semi-tones:

``` shell
$ rebar3 lfe run-escript semi-tones
```

The opening notes of "Journey of the Sourcer" (by The Eagles), used as the theme song for "The Hithiker's Guide to the Galaxy":

``` shell
$ rebar3 lfe run-escript hhgg-opening
```

## License [&#x219F;](#table-of-contents)

Copyright © 2020, Duncan McGreggor <oubiwann@gmail.com>.

<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/3434967?s=250
[logo-large]: https://avatars1.githubusercontent.com/u/3434967
[github]: https://github.com/ORG/sound-of-lfe
[gitlab]: https://gitlab.com/ORG/sound-of-lfe
[travis]: https://travis-ci.org/ORG/sound-of-lfe
[travis badge]: https://img.shields.io/travis/ORG/sound-of-lfe.svg
[gh-actions-badge]: https://github.com/ORG/sound-of-lfe/workflows/Go/badge.svg
[gh-actions]: https://github.com/ORG/sound-of-lfe/actions
[lfe]: https://github.com/rvirding/lfe
[lfe badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-19%20to%2023-blue.svg
[version]: https://github.com/ORG/sound-of-lfe/blob/master/.travis.yml
[github tags]: https://github.com/ORG/sound-of-lfe/tags
[github tags badge]: https://img.shields.io/github/tag/ORG/sound-of-lfe.svg
[github downloads]: https://img.shields.io/github/downloads/ORG/sound-of-lfe/total.svg
[hex badge]: https://img.shields.io/hexpm/v/sound-of-lfe.svg?maxAge=2592000
[hex package]: https://hex.pm/packages/sound-of-lfe
[hex downloads]: https://img.shields.io/hexpm/dt/sound-of-lfe.svg
