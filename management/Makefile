APP := mytoolbox
REGISTRY := dabizidabi
VERSION := $(shell git describe --tags)

build-image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION} -t ${REGISTRY}/${APP}:latest

push:
	docker push -a ${REGISTRY}/${APP}
