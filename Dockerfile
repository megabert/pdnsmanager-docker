FROM alpine:latest
ENV  PDNSMANAGER_VERSION=2.0.1
ENV  PDNSMANAGER_ARCHIVE=pdnsmanager-${PDNSMANAGER_VERSION}.tar.gz
ENV  PDNSMANAGER_DOWNLOAD_URL=https://dl.pdnsmanager.org/${PDNSMANAGER_ARCHIVE}

RUN apk add apache2 apache2-ctl php7-apache2 php7 php7-mysqli php7-pdo php7-pdo_mysql php7-json php7-pecl-apcu mariadb-client bash
COPY files/conf/apache-vhost.conf /etc/apache2/conf.d/pdnsmanager.conf
COPY files/archive/$PDNSMANAGER_ARCHIVE /tmp
RUN mkdir /var/www/html
RUN tar -C /var/www/html --strip-components=1 -xzf /tmp/$PDNSMANAGER_ARCHIVE pdnsmanager-${PDNSMANAGER_VERSION}/backend  pdnsmanager-${PDNSMANAGER_VERSION}/frontend
RUN chown apache:apache -R /var/www/html
RUN rm -f /tmp/$PDNSMANAGER_ARCHIVE
RUN sed -i '/LoadModule rewrite_module/s/^#//g' /etc/apache2/httpd.conf
COPY files/conf/ConfigUser.php /var/www/html/backend/config
RUN chown apache:apache -R /var/www/html
COPY files/scripts/pdnsmanager_schema_v6_extensions.sql /tmp/pdnsmanager_schema_v6_extensions.sql
COPY files/scripts/app_start /usr/local/bin/app_start
COPY files/scripts/dbsetup /usr/local/bin/dbsetup

WORKDIR /etc/apache2
CMD /usr/local/bin/app_start

