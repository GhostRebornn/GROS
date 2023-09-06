function isTrue() {
  local input
  read -p "Enter y or n: " input

  if [[ $input = "y" ]]; then
    return 0
  else
    return 1
  fi
}

printf "Synced AOSP Sources: \n"
if isTrue; then
  printf "Great!"
else
  printf "Syncing sources...\n"
  ./init.sh
fi