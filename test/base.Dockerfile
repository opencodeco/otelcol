FROM opencodeco/phpctl:php82
COPY --from=opencodeco/otelcol:v0.95.0 /otelcol /usr/bin/otelcol
RUN apk add --update --no-cache s6-overlay \
 && mkdir -p /etc/s6-overlay/s6-rc.d/otelcol \
 && echo "longrun" > /etc/s6-overlay/s6-rc.d/otelcol/type \
 && echo -e "#!/usr/bin/with-contenv ash\n/usr/bin/otelcol --config /etc/otelcol/config.yaml" > /etc/s6-overlay/s6-rc.d/otelcol/run \
 && touch /etc/s6-overlay/s6-rc.d/user/contents.d/otelcol
