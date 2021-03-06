#!/bin/bash
set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
echo "#############################################################################################"
echo
echo "This builds all the existing pkgbuilds"
echo "Scans the existing folders"
echo "Be sure you have the highest number for all of them"
echo
echo "#############################################################################################"
echo "Give the pkgversion number like 19.12"
echo "#############################################################################################"

read pkgver

echo "#############################################################################################"
echo "You typed " $pkgver
echo "#############################################################################################"
echo
echo "#############################################################################################"
echo "Give the pkgrelease number like 17"
echo "#############################################################################################"

read pkgrel

echo "#############################################################################################"
echo "You typed " $pkgrel
echo "#############################################################################################"
echo
echo "#############################################################################################"
echo "Continue ?  (y/Y)"
echo "#############################################################################################"
read response

#arcolinux-dwm-git \
#arcolinux-enlightenment-git \

array_desktops="
arcolinux-awesome-git \
arcolinux-bspwm-git \
arcolinux-budgie-git \
arcolinux-cinnamon-git \
arcolinux-deepin-git \
arcolinux-dwm-git \
arcolinux-enlightenment-git \
arcolinux-gnome-git \
arcolinux-herbstluftwm-git \
arcolinux-i3wm-git \
arcolinux-jwm-git \
arcolinux-lxqt-git \
arcolinux-mate-git \
arcolinux-openbox-git \
arcolinux-openbox-xtended-git \
arcolinux-plasma-git \
arcolinux-plasma-nemesis-git \
arcolinux-qtile-git \
arcolinux-xfce-git \
arcolinux-xmonad-polybar-git \
arcolinux-xmonad-xmobar-git \
"

if [[ "$response" == [yY] ]]; then

		count=0

		for name in $array_desktops ;
		do
			count=$[count+1]
			cd $name
			tput setaf 1;echo "Github "$count;tput sgr0;
			sed -i "s/\(^pkgver=\).*/\1$pkgver/" PKGBUILD
			sed -i "s/\(^pkgrel=\).*/\1$pkgrel/" PKGBUILD

			./build*
			echo "#############################################################################################"
			echo "################  "$(basename `pwd`)" done"
			echo "#############################################################################################"
			cd ..
		done

		echo "#############################################################################################"
		echo "###################                 Script finished                      ####################"
		echo "#############################################################################################"

    else
    	echo "#############################################################################################"
      echo "Nothing has been changed.";
fi
