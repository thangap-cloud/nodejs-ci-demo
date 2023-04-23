.PHONY: help build run push

VERSION ?= 1.0.0

APP_IMAGE_NAME ?= thangap05/demo-liefbit
NODE_ENV ?= development
APP_CONTAINER_NAME ?= myapp_container


CURDIR = $(shell pwd)

help:
	@echo "\nApplication management. \n"
	@echo "Usage: \n\
make build          This builds the $(APP_IMAGE_NAME) image. \n\
make run            This will start the application on 3000. \n\
                    Application is accessible via http://127.0.0.1:3000. \n\
make push           Build and Push the docker image to the external registry.\
"

build:
	@docker build -t $(APP_IMAGE_NAME):$(VERSION) --rm .

run:
	@make build
	@docker run -p 3000:3000 -d $(APP_IMAGE_NAME):$(VERSION)

push:
	@make build
	@docker push $(APP_IMAGE_NAME):$(VERSION)


