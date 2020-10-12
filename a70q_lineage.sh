#!bin/bash

set -e

echo " " " " " "
echo "#########################################"
echo "# Copyright 2020 — firemax13@github.com #"
echo "#########################################"
echo "#  Auto-Script Git Cloning & Fetching   #"
echo "#########################################"
echo " " " "
echo "Lineage Device & Project Tree Auto-Cloner"
echo "For Device Codename: $DEVICE_CODE"
echo " " " "

# Device Specific Branch Name & Version
DEVICE_CODE:"a70q"
LINEAGE_VERSION="lineage-17.1"
LINEAGE_OTHER_VER="laos-17.1"
BRANCH_VER="ten"
VENDOR_VER="A705FNXXU5BTC2"

echo "$DEVICE_CODE" "$DEVICE_CODE" "$DEVICE_CODE"

# Clone for Any Dependencies like Custom SLSI and etc
git clone -b $LINEAGE_VERSION https://github.com/LineageOS/android_hardware_samsung.git hardware/samsung

# Clone for Device Tree
git clone -b $BRANCH_VER https://github.com/sm7150/device_samsung_a70q.git device/samsung/$DEVICE_CODE

# Clone for Common Device Tree if exist
# git clone https://github.com/firemax13/android_device_samsung_sm7150-common device/samsung/sm7150-common

# Clone for Device Kernel
git clone -b $LINEAGE_OTHER_VER https://github.com/sm7150/a70qkernel.git kernel/samsung/DEVICE_CODE

# Clone for Specific Device Proprietary Blobs | Using wget Commands
# mkdir vendor/samsung
# wget -O vendor/samsung/$VENDOR_VER.tar https://github.com/sm7150/proprietary_vendor_samsung/releases/download/A705FNXXU5BTC2.V2/A705FNXXU5BTC2_UNCOMPRESSED_BLOBS_V2.tar.tar

# Clone for Specific Device Proprietary Blobs | Using git clone Commads
git clone https://github.com/sm7150/proprietary_vendor_samsung.git vendor/samsung/$DEVICE_CODE
