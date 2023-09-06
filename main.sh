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
}

printf "Synced AOSP Sources: \n"
if isTrue; then
  getOSDirectory
else
  printf "Syncing sources...\n"
  ./init.sh
fi