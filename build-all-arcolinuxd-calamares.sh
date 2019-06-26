#!/bin/bash

echo "First change the pkgbuild manually"
echo "Press any key to continue"
read key

for OUTPUT in $(echo arcolinuxd-calamares*/)
do
	cd $OUTPUT
  sh build*
  cd ..
done

echo "################################################################"
echo "###################      Build  Done      ######################"
echo "################################################################"
