FROM opencodeco/ocb:v0.95.0 AS builder
COPY builder-config.yaml /config.yaml
RUN /go/bin/builder --config /config.yaml

FROM scratch
COPY --from=builder /output/opencodeco-otelcol /otelcol
COPY config.yaml /config.yaml
ENTRYPOINT [ "/otelcol" ]
CMD [ "--config", "/config.yaml" ]
