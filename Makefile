.PHONY: build push clean

TAGNAME := dymaxionlabs/ai-climate-cdp-runtime
SHORT_VERSION := 0.1
PATCH_VERSION := 0
VERSION := $(SHORT_VERSION).$(PATCH_VERSION)
IMAGE_NAME := $(TAGNAME):$(VERSION)

build:
	docker build --force-rm -t $(IMAGE_NAME) .

push: build
	docker push $(IMAGE_NAME)

clean:
	docker rmi $(IMAGE_NAME)
