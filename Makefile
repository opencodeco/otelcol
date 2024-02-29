VERSION=v0.95.0

.PHONY: build
build:
	docker buildx build -t opencodeco/otelcol:$(VERSION) .

.PHONY: test
test:
	docker run --rm -p 14268:14268 -p 8125:8125 opencodeco/otelcol:$(VERSION)

.PHONY: push
push:
	docker push opencodeco/otelcol:$(VERSION)

opencodeco-otelcol:
	docker create --name opencodeco-otelcol opencodeco/otelcol:$(VERSION)
	docker cp opencodeco-otelcol:/otelcol opencodeco-otelcol
	docker rm opencodeco-otelcol