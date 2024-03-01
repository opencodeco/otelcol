.PHONY: build
build:
	docker buildx build -t otelcol-test .

.PHONY: test
test:
	docker run --rm --add-host host.docker.internal:host-gateway -p 9501:9501 otelcol-test
