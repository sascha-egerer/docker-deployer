FROM saschaegerer/composer:php-7.2

USER root

# install required package rsync
RUN set -xe && \
    apt-get update && \
    apt-get install --no-install-recommends -y rsync && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDependencies && \
    rm -rf /var/lib/apt/lists/*

COPY deployer-entrypoint.sh /

USER www-data

RUN composer global require --update-no-dev deployer/deployer:^6.2 deployer/recipes:^6.1 && \
    rm -Rf /tmp/composer/cache

ENTRYPOINT ["/deployer-entrypoint.sh"]

CMD ["list"]
