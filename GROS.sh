# Entering OS
printf '%s\n' "GROS - Ghost Reborn OS"
printf '%s' "Enter name of OS: "
read OS_NAME
printf '%s%s\n' "OS Name: " $OS_NAME

# Creating Folder
OS_PWD="/home/"$(whoami)"/"
printf '%s' $OS_PWD
cd $OS_PWD
mkdir -p $OS_NAME
cd $OS_NAME