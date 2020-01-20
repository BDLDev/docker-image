#!/bin/bash
set -euxo pipefail
git clone ${repo} /root/repo --recursive --depth 1
wget -O /root/bds.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${bds_version}.zip
mkdir /data

pushd /data
unzip /root/bds.zip
popd

pushd /root/repo
make RELEASE=1 LANG=${bdl_lang}
make install RELEASE=1 LANG=${bdl_lang} DESTDIR=/data
popd

/packager.sh /data/bedrock_server /build
/packager.sh /data/bdlauncher /build
cp -av /data /build/data