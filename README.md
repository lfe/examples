# sample-app

*An example LFE/YAWS Web App*

## Introduction

This is a quick demonstration application built using YAWS and LFE, with
additional supporting libraries.

## Use

To run the Docker image you need to have docker installed and running. Then
simply run the following:

```bash
$ docker run -p 5099:5099 -t oubiwann/lfe-yaws-sample-app:latest
```

You don't need the source code for that command; it will pull from Docker Hub.


## Builing

If you should choose to build the Docker image yourself instead of getting it
from Docker Hub:

```bash
$ git clone git@github.com:oubiwann/docker-lfe-yaws-sample-app.git
$ cd docker-lfe-yaws-sample-app
$ make docker-build
$ make docker-run
```

For more details, you'll just need to read the blog posts linked above ;-)
