set -e

# Clean Existing Cloned Git Repo To Prevent Errors
rm -rf hardware/samsung
rm -rf device/samsung/a70q
rm -rf kernel/samsung/a70q
rm -rf vendor/samsung
rm -rf device/samsung_slsi/sepolicy

# Clone All Needed for Building Lineage OS
git clone https://github.com/sm7150/android_hardware_samsung.git hardware/samsung
git clone -b test https://github.com/sm7150/device_samsung_a70q.git device/samsung/a70q
git clone https://github.com/sm7150/a70qkernel.git kernel/samsung/a70q
git clone https://github.com/sm7150/proprietary_vendor_samsung_a70q.git vendor/samsung
git clone https://github.com/LineageOS/android_device_samsung_slsi_sepolicy.git device/samsung_slsi/sepolicy

# Apply Some Patches Needed For Any Dependencies
cd frameworks/base
ls
curl https://raw.githubusercontent.com/sm7150/android_frameworks_base/lineage-17.1/0001-Base-MicroG-Patch-Frameworks-for-Signature-Spoofing.patch | git am
cd ..
cd ..

# Unexport Or Unset Any Useless Thingys
unset USE_CCACHE
unset CCACHE_EXEC

# Export Anything You Want (CCACHE, JAVA or Others)
export JAVA_TOOL_OPTIONS=-Xmx15g
export JAVA_TOOL_OPTIONS=-Xmx15g

# Clean OutPut Folders For Clean Builds
rm -rf out
rm -rf out

# Build, Lunch & Brunch Starts Here
. build/envsetup.sh ; lunch lineage_70q-eng ; brunch lineage_a70q-eng
