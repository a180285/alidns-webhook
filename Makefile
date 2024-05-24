IMAGE_NAME := a180285/alidns-webhook
IMAGE_TAG := $(shell cat VERSION)

test:
	go test -v .

docker-build-with-proxy:
	docker build --build-arg http_proxy=http://10.130.1.14:7890/ --build-arg https_proxy=http://10.130.1.14:7890/ -t $(IMAGE_NAME):$(IMAGE_TAG) .

docker:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

release:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
