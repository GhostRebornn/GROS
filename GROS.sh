# Entering OS
printf '%s\n' "GROS - Ghost Reborn OS"
printf '%s' "Enter name of OS: "
read OS_NAME
printf '%s%s\n' "OS Name: " $OS_NAME

# Creating Folder
OS_PWD="/home/"$(whoami)"/"
cd $OS_PWD
mkdir -p $OS_NAME
cd $OS_NAME

# Syncing AOSP Sources
printf "Enter Git username: "
read GIT_USERNAME
printf "Enter Git email: "
read GIT_EMAIL

git config --global credential.helper store
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

repo init --depth=1 --groups=all,-darwin -u https://android.googlesource.com/platform/manifest -b android-13.0.0_r74
repo sync -j2 -c -v --force-sync --no-clone-bundle --no-tags