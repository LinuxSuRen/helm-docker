VERSION ?= v3.13.3

test:
	docker build . --build-arg VERSION=${VERSION} -t test --no-cache
	docker run test helm version
