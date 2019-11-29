#!/usr/bin/env bash

source $(dirname "${0}")/variables

# Download the Standalone server distribution from https://www.keycloak.org/downloads.html
# e.g. https://downloads.jboss.org/keycloak/8.0.0/keycloak-8.0.0.zip
wget https://downloads.jboss.org/keycloak/$version/$archiveName

unzip $filename
