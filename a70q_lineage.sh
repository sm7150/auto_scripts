#!bin/bash

#
# Copyright 2020 — firemax13@github.com
#
# Auto-Script Git Cloning & Fetching
# 

set -e

LINEAGE_VERSION="lineage-17.1"
LINEAGE_OTHER_VER="laos-17.1"
BRANCH_VER="ten"
VENDOR_VER="10_QP1A.190711.020_A705FNXXU5BTC2"

if [ -d hardware/samsung ];then
    git clone -b $LINEAGE_VERSION https://github.com/LineageOS/android_hardware_samsung.git hardware/samsung
fi

if [ -d device/samsung/a70q ];then
    git clone -b $BRANCH_VER https://github.com/sm7150/device_samsung_a70q.git device/samsung/a70q
fi

if [ -d kernel/samsung/a70q ];then
    git clone -b $LINEAGE_OTHER_VER https://github.com/sm7150/a70qkernel.git kernel/samsung/a70q
fi

fi [ -d vendor/samsung ];then
     mkdir vendor/samsung
     wget -O vendor/samsung/$VENDOR_VER.tar https://github.com/sm7150/proprietary_vendor_samsung/releases/download/A705FNXXU5BTC2/$VENDOR_VER.tar
fi


