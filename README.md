# sample-app

*An example LFE/YAWS Web App*

## Introduction

This is a quick demonstration application built using YAWS and LFE, with
additional supporting libraries.

## Starting

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
=INFO REPORT==== 8-Apr-2016::19:04:22 ===
yaws debug:Running with id="lfeyawsdemo"
Running with debug checks turned on (slower server)
Logging to directory "yaws-sample-app/logs"
```

## Viewing

Once your ``make run`` command shows YAWS starting, it's ready to view in a
browser:

* [localhost:5099](http://localhost:5099/)

This should load up a page that looks like the following:

priv/www/images/screenshot.png

[![][screen]][screen-large]

[screen]: priv/www/images/screenshot-thumb.png
[screen-large]: https://raw.githubusercontent.com/lfex/yaws-sample-app/master/priv/www/images/screenshot.png
