FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /otelcol
COPY ./config.yaml /config.yaml
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./hyperf /app
RUN apk add --update --no-cache supervisor \
 && cd /app && composer install
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]
