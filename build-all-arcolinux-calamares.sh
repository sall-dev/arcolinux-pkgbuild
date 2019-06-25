#!/bin/bash

for OUTPUT in $(echo arcolinux-calamares*/)
do
	cd $OUTPUT
  sh build*
  cd ..
done

echo "################################################################"
echo "###################      Build  Done      ######################"
echo "################################################################"
