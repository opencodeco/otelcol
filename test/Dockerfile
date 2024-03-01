FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /usr/bin/otelcol
RUN apk add --update --no-cache execline s6-overlay \
 && mkdir -p /etc/s6-overlay/s6-rc.d/otelcol \
 && echo "longrun" > /etc/s6-overlay/s6-rc.d/otelcol/type \
 && echo -e "#!/usr/bin/execlineb -P\n/usr/bin/otelcol --config /app/config/otelcol.yaml" > /etc/s6-overlay/s6-rc.d/otelcol/run \
 && touch /etc/s6-overlay/s6-rc.d/user/contents.d/otelcol

WORKDIR /app
COPY composer.* .
RUN composer install --prefer-dist --no-dev

COPY . .
ENTRYPOINT ["/init"]
CMD ["php", "bin/hyperf.php", "start"]
