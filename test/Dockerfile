FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /usr/bin/otelcol
COPY otelcol-config.yaml /etc/otelcol/config.yaml
RUN apk add --update --no-cache s6-overlay \
 && mkdir -p /etc/s6-overlay/s6-rc.d/otelcol \
 && echo "longrun" > /etc/s6-overlay/s6-rc.d/otelcol/type \
 && echo -e "#!/usr/bin/with-contenv ash\n/usr/bin/otelcol --config /etc/otelcol/config.yaml" > /etc/s6-overlay/s6-rc.d/otelcol/run \
 && touch /etc/s6-overlay/s6-rc.d/user/contents.d/otelcol

ENV OTEL_EXPORTER_OTLP_ENDPOINT "http://host.docker.internal:4317"
ENV OTEL_EXPORTER_OTLP_INSECURE "true"

WORKDIR /app
COPY composer.* .
RUN composer install --prefer-dist --no-dev

COPY . .
ENTRYPOINT ["/init"]
CMD ["php", "bin/hyperf.php", "start"]
