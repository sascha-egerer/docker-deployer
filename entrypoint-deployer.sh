#!/usr/bin/env bash

entrypoint-composer.sh $(composer global config --absolute bin-dir)/dep "$@"
