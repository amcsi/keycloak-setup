# Keycloak example

## Requirements for keycloak server

Java 8 JDK is needed

## Steps

1. Run `bin/download-keycloak.sh` to download keycloak.
1. Run `bin/start-keycloak.sh` to run the keycloak server.
    1. Pass `-Djboss.http.port=<port>` as an argument to change the listening port from the default of 8080.
1. Visit `http://localhost:8080`.

