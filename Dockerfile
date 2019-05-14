FROM mysql:5

ENV MYSQL_ROOT_PASSWORD rootpassword
ENV MYSQL_DATABASE spiderweb_dev
ENV MYSQL_USER spiderweb_dev
ENV MYSQL_PASSWORD password

ADD setup.sql /docker-entrypoint-initdb.d