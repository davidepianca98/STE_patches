#!/usr/bin/env bash

if [ "$1" = "-u" ]
then
echo ""
echo "Welcome to KINGbabasula's"
echo "STE patching script."
echo ""
echo "Usage:"
echo ""
echo "./patch.sh"
echo ""
echo "Arguments:"
echo ""
echo "-c - Cleans your repos before patching."
echo "-u - Shows usage."
echo ""
fi

if [ "$1" = "-c" ]
then
echo "Removing repos..."
rm -rf frameworks/av
rm -rf frameworks/base
rm -rf frameworks/native
rm -rf hardware/libhardware_legacy
rm -rf packages/services/Telephony
rm -rf system/core
echo "Syncing latest changes..."
repo sync -c -d -f -j5
fi

echo "Patching frameworks/base"
cp patches/frameworks_base.patch frameworks/base/frameworks_base.patch
cd frameworks/base
git apply frameworks_base.patch
rm frameworks_base.patch
cd ../..

echo ""

echo "Patching frameworks/av"
cp patches/frameworks_av.patch frameworks/av/frameworks_av.patch
cd frameworks/av
git apply frameworks_av.patch
rm frameworks_av.patch
cd ../..

echo ""

echo "Patching frameworks/native"
cp patches/frameworks_native.patch frameworks/native/frameworks_native.patch
cd frameworks/native
git apply frameworks_native.patch
rm frameworks_native.patch
cd ../..

echo ""

echo "Applying vibrator fix"

cp patches/vibrator_fix.patch hardware/libhardware_legacy/vibrator_fix.patch
cd hardware/libhardware_legacy
git apply vibrator_fix.patch
rm vibrator_fix.patch
cd ../..

echo ""

echo "Patching system/core"
cp patches/system_core.patch system/core/system_core.patch
cd system/core
git apply system_core.patch
rm system_core.patch
cd ../..

echo "Patching packages/services/Telephony"
cp patches/packages_services_Telephony.patch packages/services/Telephony/packages_services_Telephony.patch
cd packages/services/Telephony
git apply packages_services_Telephony.patch
rm packages_services_Telephony.patch
cd ../../..
