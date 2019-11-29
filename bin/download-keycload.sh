#!/usr/bin/env bash

version=8.0.0
filename=keycloak-$version.zip

wget https://downloads.jboss.org/keycloak/$version/$filename
unzip $filename
