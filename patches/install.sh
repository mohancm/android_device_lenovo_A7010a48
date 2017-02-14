echo $1
rootdirectory="/home/techkid/rr14.1/"
# ---------------------------------

dirs="bionic frameworks/av frameworks/base frameworks/native hardware/libhardware packages/apps/Settings system/core system/netd"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/lenovo/A7010a48/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
