.PHONY: build push clean

TAGNAME := dymaxionlabs/ai-climate-cdp-runtime
SHORT_VERSION := 0.3
PATCH_VERSION := 0
VERSION := $(SHORT_VERSION).$(PATCH_VERSION)
IMAGE_NAME := $(TAGNAME):$(VERSION)

build:
	docker build --build-arg short_version=$(SHORT_VERSION) --build-arg maintenance_version=$(PATCH_VERSION) --force-rm -t $(IMAGE_NAME) .

push: build
	docker push $(IMAGE_NAME)

run: build
	docker run -ti $(IMAGE_NAME) /bin/bash

clean:
	docker rmi $(IMAGE_NAME)
