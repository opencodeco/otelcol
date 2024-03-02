.PHONY: build
build:
	docker buildx build -t otelcol-test-base -f base.Dockerfile .
	docker buildx build -t otelcol-test .

.PHONY: test
test:
	docker run --rm \
	--add-host host.docker.internal:host-gateway \
	--env OTEL_EXPORTER_OTLP_ENDPOINT=host.docker.internal:4317 \
	--env OTEL_EXPORTER_OTLP_INSECURE=true \
	-p 9501:9501 otelcol-test
