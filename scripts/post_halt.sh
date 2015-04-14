#!/bin/bash
# Runs all scripts in turn located in user_scripts/halt
# This is done after vagrant halted the vm

for f in user_scripts/halt/* ; do 
	[[ -f $f ]] || continue
	if [[ -x $f ]] ; then
		echo $(basename $f)
		$f
	else
		echo "Not executable! Skipping $f"
	fi
done
