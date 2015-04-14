#!/bin/bash
# Runs all scripts in turn located in user_scripts/up
# This is done after vagrant brought up the vm

for f in user_scripts/up/* ; do 
	[[ -f $f ]] || continue
	if [[ -x $f ]] ; then
		echo $(basename $f)
		$f
	else
		echo "Not executable! Skipping $f"
	fi
done
