echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="bionic frameworks/av packages/apps/Settings system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/lenovo/A7010a48/patches/$dir/*.patch
	echo " "
done

#cd $rootdirectory
#cd packages/apps/SetupWizard
#echo "Applying packages/apps/SetupWizard patches..."
#git reset cd34a5865fc0799ddd222b9871b4fd3f08b9d5cf --hard
#echo " "

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
