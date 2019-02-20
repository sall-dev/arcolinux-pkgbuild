#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=arcolinux

#### via clean chroot

# CHROOT=$HOME/Documents/chroot-arcolinux
# arch-nspawn $CHROOT/root pacman -Syu
# makechrootpkg -c -r $CHROOT
#
# echo "signing the package"
# gpg --detach-sign $search*pkg.tar.xz


# or via makepkg

makepkg --sign


#### cleaning up

echo "moving created files to repo"
mv $search*pkg.tar.xz ../../arcolinux_repo/x86_64/
mv $search*pkg.tar.xz.sig ../../arcolinux_repo/x86_64/






echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"
