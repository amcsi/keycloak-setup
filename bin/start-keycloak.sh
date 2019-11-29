#!/usr/bin/env bash

source $(dirname "${0}")/variables

# Go to the keycloak server's bin directory and run standalone.sh
$dirName/bin/standalone.sh "$@"
