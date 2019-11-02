#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=arcolinux
echo "We will start building "$search "now."
echo "###########################################################"
echo

tput setaf 2
echo "################################################################"
echo "#########        Let us build this package      ################"
echo "################################################################"
tput sgr0

CHOICE=1

case $CHOICE in

    2 )
    # or via makepkg
    makepkg --sign

    #or
    #makepkg
    #gpg --detach-sign $search*pkg.tar.xz
      ;;
    1 )
    #### via clean chroot

    CHROOT=$HOME/Documents/chroot-arcolinux
    arch-nspawn $CHROOT/root pacman -Syu
    makechrootpkg -c -r $CHROOT

    echo "Signing the package"
    echo "###########################################################"
    echo
    gpg --detach-sign $search*pkg.tar.xz

      ;;
    0 )
        echo "########################################"
        echo "We did nothing as per your request"
        echo "########################################"
        ;;

    * )
    echo "#################################"
		echo "Choose the correct number"
    echo "#################################"
		;;
esac

echo "Moving created files to repo"
echo "###########################################################"
echo
mv $search*pkg.tar.xz ../../arcolinux_repo/x86_64/
mv $search*pkg.tar.xz.sig ../../arcolinux_repo/x86_64/

echo "Cleaning up"
echo "###########################################################"
echo

echo "deleting unnecessary folders"
echo "###########################################################"
echo

rm -rf pkg src
rm -rf *.log

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
		 -not -name 'build*'\
		 -not -name 'modprobe.d*'\
		 -not -name '*.install'\
		 -not -name '*.patch'\
		 -not -name '*.png'\
		 -not -name '*.jpg'\
		 -not -name '*.cfg'\
		 -not -name '*.desktop'\
     -not -name 'arco*'\
     -not -name '*.po'\
		 -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"
