.PHONY: build
build:
	docker buildx build -t otelcol-test .

.PHONY: test
test:
	docker run --rm --net host otelcol-test
