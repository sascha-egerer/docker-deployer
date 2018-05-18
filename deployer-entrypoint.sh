#!/usr/bin/env bash

/composer-entrypoint.sh $(composer global config --absolute bin-dir)/dep "$@"
