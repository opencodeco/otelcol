FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /otelcol
COPY ./config.yaml /config.yaml
COPY ./hyperf /app
RUN apk add --update --no-cache s6-overlay \
 && cd /app && composer install
ENTRYPOINT ["/init"]
