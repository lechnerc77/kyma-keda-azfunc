RELEASE=0.0.1
APP=simple-queue-azfunc
DOCKER_ACCOUNT=<Your Docker Account>
CONTAINER_IMAGE=${DOCKER_ACCOUNT}/${APP}:${RELEASE}

.PHONY: build-image push-image

build-image:
	docker build -t $(CONTAINER_IMAGE) --no-cache --rm .

build-and-push-image: build-image
	docker push $(CONTAINER_IMAGE)

push-image:
	docker push $(CONTAINER_IMAGE)

docker-run:
	docker run -it -p 8080:80 $(CONTAINER_IMAGE)