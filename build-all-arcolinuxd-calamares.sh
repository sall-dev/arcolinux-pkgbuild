#!/bin/bash

for OUTPUT in $(echo arcolinuxd-calamares*/)
do
	cd $OUTPUT
  sh build*
  cd ..
done

echo "################################################################"
echo "###################      Build  Done      ######################"
echo "################################################################"
