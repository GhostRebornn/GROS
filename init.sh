# Entering OS
printf '%s\n' "GROS - Ghost Reborn OS"
printf '%s' "Enter name of OS: "
read OS_NAME
printf '%s%s\n' "OS Name: " $OS_NAME

# Creating Folder
OS_PWD="/home/"$(whoami)"/"
CUR_DIR=$(pwd)
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

link_snippets() {
    cp -r $CUR_DIR/snippets $OS_PWD$OS_NAME/.repo/manifests/
    cd $OS_PWD$OS_NAME/.repo/manifests
    sed 's/fetch=".."/fetch="android.googlesource.com"/' default.xml > temp.txt && mv temp.txt default.xml
    awk '
        /<include name="snippets\/GROS.xml" \/>/ {
            found = 1
        }
        {
            a[i++] = $0
        }
        END {
            if (!found) {
                i--
            }
            for (j = 0; j < i; j++) {
                print a[j]
            }
        }
        END {
            if (!found) {
                print "  <include name=\"snippets/GROS.xml\" />"
                print "</manifest>"
            }
        }
        ' default.xml > temp.txt && mv temp.txt default.xml
    cd ..
    cd ..
}

repo init --depth=1 --groups=all,-darwin -u https://android.googlesource.com/platform/manifest -b android-13.0.0_r82
link_snippets
repo sync -j2 -c -v --force-sync --no-clone-bundle --no-tags
