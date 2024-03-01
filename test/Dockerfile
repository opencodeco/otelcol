FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /otelcol
RUN apk add --update --no-cache s6-overlay \
 && mkdir -p /etc/s6-overlay/s6-rc.d/otelcol \
 && echo "longrun" > /etc/s6-overlay/s6-rc.d/otelcol/type \
 && echo "/otelcol --config /app/config/otelcol.yaml" > /etc/s6-overlay/s6-rc.d/otelcol/run \
 && touch /etc/s6-overlay/s6-rc.d/user/contents.d/otelcol

WORKDIR /app
COPY composer.* .
RUN composer install

COPY . .
ENTRYPOINT ["/init"]
CMD ["php", "bin/hyperf.php", "start"]
