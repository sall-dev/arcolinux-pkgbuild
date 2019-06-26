#!/bin/bash

count=0
echo "We cut the version 19.7.1 in two parts"
echo "Give old package version like 19.7"
read oldpkgversion
echo "Give old package release like 1"
read oldpkgrelease

echo "Give new packageversion"
read newpkgversion
echo "Give new package release"
read newpkgrelease

echo "We will change all old instances i.e. "$oldpkgversion" to this version: "$newpkgversion
echo "We will change all old instances i.e. "$oldpkgrelease" to this version: "$newpkgrelease
echo "Is this correct?  (y/n) "
read response
if [[ "$response" == [yY] ]]; then

		for OUTPUT in $(echo arcolinuxb-calamares*/)
		do
			cd $OUTPUT
			count=$[count+1]
			tput setaf 1;echo "Github "$count;tput sgr0;
			echo "#################################################"
			echo "################  "$(basename `pwd`)" Start"
			echo "#################################################"
			echo "Changing all instances";
			sed -i 's/pkgver='$oldpkgversion'/pkgver='$newpkgversion'/g' PKGBUILD
			sed -i 's/pkgrel='$oldpkgrelease'/pkgrel='$newpkgrelease'/g' PKGBUILD
		  sh build*
			echo "#################################################"
			echo "################  "$(basename `pwd`)" Stop"
			echo "#################################################"
			cd ..
		done

    echo "All done"
		notify-send -u normal "All versions have been updated. Carry on!"

    else
    	echo "################################################################"
      echo "Nothing has been changed.";
		notify-send -u normal "Nothing has changed!"
fi

echo "################################################################"
echo "###################      Build  Done      ######################"
echo "################################################################"
