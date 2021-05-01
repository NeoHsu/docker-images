REGISTRY=neohsudroid

.PHONY: docker-build
## docker-build: build docker image
docker-build:
	docker build --build-arg VERSION=${VERSION} --no-cache -t ${REGISTRY}/${IMAGE}:${VERSION} -f ${IMAGE}/Dockerfile .

.PHONY: docker-push
## docker-push: push the docker image to registry
docker-push: docker-build
	docker push ${REGISTRY}/${IMAGE}:${VERSION}

.PHONY: help
## help: Prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'