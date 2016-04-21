# lfeyawsdemo

*A Sample LFE+YAWS Web Application*


#### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [Starting](#starting-)
* [Viewing](#viewing-)
* [Docker](#docker-)


## Introduction [&#x219F;](#contents)

This is a quick demonstration application built using YAWS and LFE, with
additional supporting libraries.


## Dependencies [&#x219F;](#contents)

This demo assumes you have the following installed on your system:

* Erlang
* ``build-essential`` or the equivalent developer tools (including
  autotools, ``make``, and ``gcc``)
* Any system-specific YAWS dependencies (e.g., ``libpam0g-dev`` on Ubuntu)
* ``rebar3``


## Starting [&#x219F;](#contents)

To run the sample LFE/YAWS app, just do:

```bash
$ make run
```

This will download and build the dependencies as well as attempt to compile
YAWS for you. If you are not running on Linux, this may not work and you will
need to swtch to ``_build/default/lib/yaws``, scan the ``README``s and then
build.

After a successful ``make run`` you will see output like the following:

```
=INFO REPORT==== 8-Apr-2016::19:50:15 ===
yaws debug:Running with id="lfeyawsdemo"
Running with debug checks turned on (slower server)
Logging to directory "lfeyawsdemo/log"
```


## Viewing [&#x219F;](#contents)

Once your ``make run`` command shows YAWS starting, it's ready to view in a
browser:

* [localhost:5099](http://localhost:5099/)

This should load up a page that looks like the following:

[![][screen]][screen-large]

[screen]: priv/www/images/screenshot-thumb.png
[screen-large]: https://raw.githubusercontent.com/lfex/yaws-sample-app/master/priv/www/images/screenshot.png


## Docker [&#x219F;](#contents)

This project was originally derrived from the
[LFE/YAWS Docker sample app](https://github.com/lfex/docker-lfe-yaws-sample-app).
However, after that code was used to generate the lfeyawsdemo project, the
original was updated to use the new lfeyawsdemo project. As such, both projects
now use the same code.
