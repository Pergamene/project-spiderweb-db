### Edit these variables ###
IMG_NAME=sp-mysql
PORT=3306
TAG=latest
VOLUME_TO_MOUNT=$(shell pwd)
SET_NODE_ENV=dev
### End of edit ###

IMG=spiderweb/$(IMG_NAME)
CONTAINER=$(IMG_NAME)
RUNOPTS=-p $(PORT):$(PORT)
VOLUME_DESTINATION=/home/default

build:
	docker build -t $(IMG):$(TAG) .

run-enter: rm
	docker run -it $(RUNOPTS) --name $(CONTAINER) -v $(VOLUME_TO_MOUNT):$(VOLUME_DESTINATION) -e ENVIRONMENT=dev $(IMG):$(TAG) /bin/bash

run-dev: rm
	docker run -it -d $(RUNOPTS) --name $(CONTAINER) -v $(VOLUME_TO_MOUNT):$(VOLUME_DESTINATION) -e ENVIRONMENT=dev $(IMG):$(TAG)

push:
	docker push $(IMG):$(TAG)

rm:
	docker stop $(CONTAINER) && docker rm -f $(CONTAINER) || true

enter:
	docker exec -it $(CONTAINER) /bin/bash