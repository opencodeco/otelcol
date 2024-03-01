FROM opencodeco/phpctl:php82
WORKDIR /app
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /usr/bin/otelcol
RUN apk add --update --no-cache s6-overlay
COPY composer.* .
RUN composer install
COPY rootfs /
COPY . .
RUN rm -r rootfs
ENTRYPOINT ["/init"]
CMD ["php", "bin/hyperf.php", "start"]
