FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /usr/bin/otelcol
COPY ./otelcol-config.yaml /etc/otelcol/config.yaml
COPY ./hyperf /usr/local/src
COPY ./s6 /etc/s6-overlay/s6-rc.d
RUN apk add --update --no-cache s6-overlay \
 && cd /usr/local/src && composer install
ENTRYPOINT ["/init"]
