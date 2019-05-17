IMG_TAG = lfex/lfeyawsdemo
default: image

image:
	docker build . -t $(IMG_TAG)

push-image: image
	docker push $(IMG_TAG)

run: image
	docker run -it -p 5099:5099 $(IMG_TAG)

repl: image
	docker run -it -p 5099:5099 --entrypoint=./bin/repl $(IMG_TAG)

push:
	docker push $(IMG_TAG)