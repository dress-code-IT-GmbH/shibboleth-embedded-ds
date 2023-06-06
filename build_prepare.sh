#!/bin/bash

TV="1.2.2"
TARGET=shibboleth-embedded-ds-${TV}

rm -rf shibboleth-embedded-ds*
rm -f yuicompressor-2.4.8.jar

wget https://shibboleth.net/downloads/embedded-discovery-service/${TV}/${TARGET}.tar.gz
wget https://shibboleth.net/downloads/embedded-discovery-service/${TV}/${TARGET}.tar.gz.sha256

sha256sum -c ${TARGET}.tar.gz.sha256

if [ $? != 0 ] ; then
    echo "checksum failed!"
fi

wget https://github.com/yui/yuicompressor/releases/download/v2.4.8/yuicompressor-2.4.8.jar
sha256sum -c yuicompressor-2.4.8.jar.sha256

if [ $? != 0 ] ; then
    echo "checksum failed!"
fi

mkdir -p build
mv yuicompressor-2.4.8.jar build

tar -xzf ${TARGET}.tar.gz

# reconstruct source build tree

mkdir -p src/javascript
cp ${TARGET}/nonminimised/*.js src/javascript

mkdir -p src/resources
cp ${TARGET}/index.html src/resources
cp ${TARGET}/blank.gif src/resources
cp ${TARGET}/idpselect.css src/resources

mkdir -p src/apache
cp ${TARGET}/shibboleth-ds.conf src/apache

mkdir -p doc
cp ${TARGET}/README.txt doc
cp ${TARGET}/RELEASE-NOTES.txt doc


cp ${TARGET}/Makefile .
cp ${TARGET}/shibboleth-embedded-ds.spec .
cp ${TARGET}/LICENSE.txt .

patch -p0 < 1_whitelist.patch
patch -p0 < 2_delay_call.patch
patch -p0 < 3_makefile.patch
