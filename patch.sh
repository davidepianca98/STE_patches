#!/bin/bash

rm -rf frameworks/av
rm -rf frameworks/native
rm -rf hardware/libhardware
rm -rf hardware/libhardware_legacy
rm -rf system/netd
rm -rf packages/apps/Phone

repo sync

echo "Applying Oliver patches - android_frameworks_av"
cp patches/frameworks_av.patch frameworks/av/frameworks_av.patch
cd frameworks/av
git apply frameworks_av.patch
rm frameworks_av.patch
cd ../..

echo ""

echo "Applying Oliver patches - android_frameworks_native"
cp patches/frameworks_native.patch frameworks_native.patch
git apply frameworks_native.patch
rm frameworks_native.patch

echo ""

echo "Applying hardware patches"
cp patches/hardware_libhardware.patch hardware_libhardware.patch
git apply hardware_libhardware.patch
rm hardware_libhardware.patch
echo ""
cp patches/hardware_libhardware_legacy.patch hardware/libhardware_legacy/hardware_libhardware_legacy.patch
cd hardware/libhardware_legacy
git apply hardware_libhardware_legacy.patch
rm hardware_libhardware_legacy.patch
cd ../..

echo "Applying system_netd patch"
cp patches/system_netd.patch system_netd.patch
git apply system_netd.patch
rm system_netd.patch

echo "Applying packages_apps_Phone patch"
cp patches/packages_apps_Phone.patch packages/apps/Phone/packages_apps_Phone.patch
cd packages/apps/Phone
git apply packages_apps_Phone.patch
rm packages_apps_Phone.patch
cd ../..
