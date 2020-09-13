IMG_TAG = lfex/lfeyawsdemo
DEV_IMG_TAG = lfex/yaws-dev
DEV_BUILD_DIR = priv/docker/dev

default: image

$(DEV_BUILD_DIR)/.build:
	docker build $(DEV_BUILD_DIR) -t $(DEV_IMG_TAG)
	touch $(DEV_BUILD_DIR)/.build

image: | $(DEV_BUILD_DIR)/.build
	docker build . -t $(IMG_TAG)

push-image: image
	docker push $(IMG_TAG)

run: image
	docker run -it -p 5099:5099 $(IMG_TAG)

repl: image
	docker run -it -p 5099:5099 --entrypoint=./bin/repl $(IMG_TAG)

push:
	docker push $(IMG_TAG)