FROM mysql
ENV MYSQL_ROOT_PASSWORD=mysql
ENV MYSQL_USER=dev1
ENV MYSQL_PASSWORD=mysql
ENV MYSQL_DATABASE=kakkai_project

COPY dbscript.sql /docker-entrypoint-initdb.d
EXPOSE 3306
