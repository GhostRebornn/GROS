function isTrue() {
  local input
  read -p "Enter y or n: " input

  if [[ $input = "y" ]]; then
    return 0
  else
    return 1
  fi
}

function getOSDirectory() {
  read -p "Enter OS Directory like /home/user/some/os/path: " OS_PATH
  cd $OS_PATH
  printf "Resync sources: \n"
  if isTrue; then
    repo init --depth=1 --groups=all,-darwin -u https://android.googlesource.com/platform/manifest -b android-13.0.0_r74
    repo sync -j2 -c -v --force-sync --no-clone-bundle --no-tags
  fi
}

printf "Synced AOSP Sources: \n"
if isTrue; then
  getOSDirectory
else
  printf "Syncing sources...\n"
  ./init.sh
fi