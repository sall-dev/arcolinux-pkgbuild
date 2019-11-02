#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

# "Select build"
# "1. chroot"
# "2. makepkg"
build="2"

# "Select destination"
# "1. arcolinux_repo"
# "2. arcolinux_repo_3party"
# "3. arcolinux_repo_testing"
# "4. arcolinux_repo_iso"
destination="2"


################################################################
################################################################


base_dir="/home/erik/ARCOLINUX"
search=$(basename "$PWD")
tput setaf 1
echo "###########################################################"
echo "We will start building "$search "now."
echo "###########################################################"
tput sgr0
echo

echo "################################################################"
echo "#########        Let us build this package      ################"
echo "################################################################"
echo

case $build in

    1 )
    CHROOT=$HOME/Documents/chroot
    arch-nspawn $CHROOT/root pacman -Syu
    makechrootpkg -c -r $CHROOT
    echo
    echo "################################################################"
    echo "Signing the package"
    echo "################################################################"
    echo
    gpg --detach-sign $search*pkg.tar.xz
    echo
    ;;

    2 )
    makepkg --sign
    echo
    ;;
esac


case $destination in

    1 )
    #1. arcolinux_repo
    mv $search*pkg.tar.xz $base_dir/arcolinux_repo/x86_64/
    mv $search*pkg.tar.xz.sig $base_dir/arcolinux_repo/x86_64/
    echo "Moved the files to " $base_dir"/arcolinux_repo/x86_64/"
    echo "################################################################"
    echo
    ;;
    2 )
    #2. arcolinux_repo_3party
    mv $search*pkg.tar.xz $base_dir/arcolinux_repo_3party/x86_64/
    mv $search*pkg.tar.xz.sig $base_dir/arcolinux_repo_3party/x86_64/
    echo "Moved the files to " $base_dir"/arcolinux_repo_3party/x86_64/"
    echo "################################################################"
    echo
    ;;
    3 )
    #3. arcolinux_repo_testing
    mv $search*pkg.tar.xz $base_dir/arcolinux_repo_testing/x86_64/
    mv $search*pkg.tar.xz.sig $base_dir/arcolinux_repo_testing/x86_64/
    echo "Moved the files to " $base_dir"/arcolinux_repo_testing/x86_64/"
    echo "################################################################"
    echo
    ;;
    4 )
    #4. arcolinux_repo_iso
    mv $search*pkg.tar.xz $base_dir/arcolinux_repo_iso/x86_64/
    mv $search*pkg.tar.xz.sig $base_dir/arcolinux_repo_iso/x86_64/
    echo "Moved the files to " $base_dir"/arcolinux_repo_iso/x86_64/"
    echo "################################################################"
    echo
    ;;
esac

echo "deleting unnecessary folders"
echo "################################################################"
echo

rm -rf pkg src

echo "deleting unnecessary files"
echo "################################################################"
echo

find .   	-not -name Makefile\
		-not -name readme.install\
		-not -name 'LICENSE'\
		-not -name 'LICENCE.md'\
		-not -name 'MKPKG'\
		-not -name 'PKGBUILD'\
		-not -name 'install'\
		-not -name 'build-v*'\
		-not -name 'modprobe.d*'\
		-not -name '*.cfg'\
		-not -name '*.conf'\
		-not -name '*.desktop'\
 		-not -name '*.d*'\
		-not -name '*.hook'\
		-not -name '*.install'\
		-not -name '*.jpg'\
		-not -name '*.patch'\
		-not -name '*.png'\
		-not -name '*.po'\
  	-not -name '*.protocol'\
		-not -name '*.py'\
		-not -name '*.prf'\
    -not -name '*.service'\
    -not -name '*.sh'\
    -not -name '*.txt'\
		-delete

tput setaf 2
echo "################################################################"
echo "##########    Building "$search" is finished"
echo "################################################################"
tput sgr0
