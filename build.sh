# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/xdroid-oss/xd_manifest -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b xd .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch xdroid_X00TD-userdebug
export TZ=Asia/Shanghai
#export ALLOW_MISSING_DEPENDENCIES=true
make xd -j8
# end
