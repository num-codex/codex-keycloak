FROM jboss/keycloak:12.0.1

ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=admin

COPY ./docker/keycloak-dump.json /tmp/keycloak-dump.json

EXPOSE 8080

CMD ["-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=singleFile", "-Dkeycloak.migration.file=/tmp/keycloak-dump.json"]
