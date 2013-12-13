#!/bin/bash

rm -rf frameworks/av
rm -rf frameworks/native
rm -rf hardware/libhardware
rm -rf hardware/libhardware_legacy
rm -rf system/netd

repo sync

echo "Apllying Oliver patches - android_frameworks_av"
cp frameworks_av.patch frameworks/av/frameworks_av.patch
cd frameworks/av
git apply frameworks_av.patch
cd ../..

echo ""

echo "Applying Oliver patches - android_frameworks_native"
git apply frameworks_native.patch

echo ""

echo "Applying hardware patches"
git apply hardware_libhardware.patch
echo ""
cp hardware_libhardware_legacy.patch hardware/libhardware_legacy/hardware_libhardware_legacy.patch
cd hardware/libhardware_legacy
git apply hardware_libhardware_legacy.patch
cd ../..

echo "Applying system_netd patch"
git apply system_netd.patch