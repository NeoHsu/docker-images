REGISTRY=neohsudroid
.DEFAULT_GOAL := help

.PHONY: docker-build
docker-build: ## docker-build: build docker image
	docker build --build-arg VERSION=${VERSION} --no-cache -t ${REGISTRY}/${IMAGE}:${VERSION} -f ${IMAGE}/Dockerfile .

.PHONY: docker-push
docker-push: docker-build  ## push the docker image to registry
	docker push ${REGISTRY}/${IMAGE}:${VERSION}

.PHONY: help 
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'