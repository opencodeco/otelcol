.PHONY: build
build:
	docker buildx build -t otelcol-test .

.PHONY: test
test:
	docker run --rm -p 9501:9501 otelcol-test
