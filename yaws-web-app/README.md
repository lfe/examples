# lfeyawsdemo

*A Sample LFE+YAWS Web Application*


#### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [Starting](#starting-)
* [Viewing](#viewing-)


## Introduction [&#x219F;](#contents)

This is a quick demonstration application built using YAWS and LFE, with
additional supporting libraries.


## Dependencies [&#x219F;](#contents)

This demo assumes you have `docker` installed on your system -- that's it!


## Starting [&#x219F;](#contents)

To run the sample LFE/YAWS app, just do:

```bash
$ make run
```

Or, if you don't want to download this repo, you can just do this instead:

```bash
$ docker run -it -p 5099:5099 lfex/lfeyawsdemo
```

The make target will build and run the app, the `docker` command will just 
download the pre-build Docker image.

After a short while, you will see output like the following:

```
2019-05-17 00:41:19.894 [<0.134.0>] [info] Yaws: Listening to 0.0.0.0:5099 for <1> virtual servers:
 - http://localhost:5099 under /lfeyawsdemo/priv/www
```


## Viewing [&#x219F;](#contents)

As soon as you see the above message in the output, you're ready to visit the site:

* [localhost:5099](http://localhost:5099/)

This should load up a page that looks like the following:

[![][screen]][screen-large]

If you're curious about the dependencies and versions, there's a page for that, too ;-)

[![][screen-versions]][screen-versions-large]

[screen]: priv/www/images/screenshot-thumb.png
[screen-large]: https://raw.githubusercontent.com/lfex/yaws-sample-app/master/priv/www/images/screenshot.png
[screen-versions]: priv/www/images/screenshot-versions-thumb.png
[screen-versions-large]: https://raw.githubusercontent.com/lfex/yaws-sample-app/master/priv/www/images/screenshot-versions.png
