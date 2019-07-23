#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=arcolinux

#### via clean chroot

CHROOT=$HOME/Documents/chroot-arcolinux
arch-nspawn $CHROOT/root pacman -Syu
makechrootpkg -c -r $CHROOT

echo "###########################################################"
echo "Signing the package"
echo "###########################################################"
gpg --detach-sign $search*pkg.tar.xz

echo "Moving created files to repo"
echo "###########################################################"
echo
mv $search*pkg.tar.xz ../../arcolinux_repo_iso/x86_64/
mv $search*pkg.tar.xz.sig ../../arcolinux_repo_iso/x86_64/

echo "Cleaning up"
echo "###########################################################"
echo

echo "deleting unnecessary folders"
echo "###########################################################"
echo

rm -rf pkg src

echo "deleting unnecessary files"
echo "###########################################################"
echo

find .   -not -name Makefile\
		 -not -name readme.install\
		 -not -name 'PKGBUILD'\
		 -not -name 'MKPKG'\
		 -not -name 'LICENCE.md'\
		 -not -name 'install'\
		 -not -name '*.prf'\
		 -not -name '*.hook'\
		 -not -name '*.conf'\
		 -not -name 'LICENSE'\
		 -not -name 'build-*'\
		 -not -name 'modprobe.d*'\
		 -not -name '*.install'\
		 -not -name '*.patch'\
		 -not -name '*.png'\
		 -not -name '*.jpg'\
		 -not -name '*.cfg'\
		 -not -name '*.desktop'\
		 -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"