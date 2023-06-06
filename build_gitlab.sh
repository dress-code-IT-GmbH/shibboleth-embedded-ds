#!/bin/bash

bash build.sh

mkdir -p kit
cp -a shibboleth-embedded-ds-patched-1.2.2 kit

sha256sum shibboleth-embedded-ds-patched-1.2.2.tar.gz > shibboleth-embedded-ds-patched-1.2.2.tar.gz.sha256
