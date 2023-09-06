function isTrue() {
  local input
  read -p "Enter y or n: " input

  if [[ $input = "y" ]]; then
    return 0
  else
    return 1
  fi
}

echo "Synced AOSP Sources: \n"
if isTrue; then
  echo "Great!"
else
  echo "Syncing sources..."
  ./init.sh
fi