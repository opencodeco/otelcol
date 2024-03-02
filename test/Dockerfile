FROM otelcol-test-base
COPY composer.* .
RUN composer install --prefer-dist --no-dev
COPY . .
COPY otelcol-config.yaml /etc/otelcol/config.yaml
ENTRYPOINT ["/init"]
CMD ["php", "bin/hyperf.php", "start"]
