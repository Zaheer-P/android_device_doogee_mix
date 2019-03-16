#
# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

for var in eng user userdebug; do
  add_lunch_combo lineage_mix-$var
done

#!/bin/sh
cd bionic
wget https://github.com/PainKiller3/patches_Mtk/raw/master/bionic.patch
patch -p1 < bionic.patch

cd .. && cd external/wpa_supplicant_8/
wget https://github.com/PainKiller3/patches_Mtk/raw/master/external_nvram.patch
patch -p1 < external_nvram.patch
cd .. && cd ..

cd frameworks/av
wget https://github.com/PainKiller3/patches_Mtk/raw/master/frameworks_av_audioflinger.patch
wget https://github.com/PainKiller3/patches_Mtk/raw/master/frameworks_av_camera.patch
wget https://github.com/PainKiller3/patches_Mtk/raw/master/frameworks_av_libmedia.patch
wget https://github.com/PainKiller3/patches_Mtk/raw/master/frameworks_av_mediaprofile.patch
patch -p1 < frameworks_av_audioflinger.patch
patch -p1 < frameworks_av_camera.patch
patch -p1 < frameworks_av_libmedia.patch
patch -p1 < frameworks_av_mediaprofile.patch
cd ..

cd native
wget https://github.com/PainKiller3/patches_Mtk/raw/master/frameworks_native_ui.patch
patch -p1 < frameworks_native_ui.patch
cd .. && cd ..

cd system/core
wget https://github.com/PainKiller3/patches_Mtk/raw/master/system_core.patch
patch -p1 < system_core.patch
cd ..

cd netd
wget https://github.com/PainKiller3/patches_Mtk/raw/master/system_netd.patch
patch -p1 < system_netd.patch
