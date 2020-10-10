#!bin/bash

echo " " " " " "
echo "#######################################"
echo "Auto-Builder Script for Lineage Compile"
echo "#######################################"
echo " Copyright 2020 - firemax13@github.com "
echo "#######################################"
echo "Auto-Script Builder for High-RAM Compile"
echo "#######################################"
echo " " " " " "

set -e 

echo " " " " "Exporting Some Useful Tools" " "
# Export Some Java Size Tools & Other things
export JAVA_TOOL_OPTIONS=-Xmx8g
export JAVA_TOOL_OPTIONS=-Xmx8g

echo " " " " "Unexporting Some Useless Tools" " "
# Unexport CCACHE. CCACHE will slow down build & make some errors if dirty building
unexport USE_CCACHE=1
unexport USE_CCACHE=1
unexport CCACHE_EXEC=/usr/bin/ccache
unexport CCACHE_EXEC=/usr/bin/ccache

# Device Codenames & other settings
DEVICE_CODE="a70q"

# Do initialize 
. build/envsetup.sh

# Lunch Device
lunch lineage_$DEVICE_CODE-userdebug

############################################################################################
# Start Building for JAVA Docs first to prevent any further stoppage of errors for Low-RAM #
# mka api-stubs-docs                                                                       #
# mka hiddenapi-lists-docs                                                                 #
# mka system-api-stubs-docs                                                                #
# mka test-api-stubs-docs                                                                  #
############################################################################################

# Brunch Device
brunch lineage_$DEVICE_CODE-userdebug
