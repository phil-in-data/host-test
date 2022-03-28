#!/bin/zsh

# confirm hostname passed
if [ -z $1 ]; then
   echo "Exiting.  Must pass a hostname to check"
   exit 0
fi

# test if host dns has propogated
test=0
while [ $test -eq 0 ]
do
  hosttest=$(host $1)
  if [[ "$hosttest" == *"has address"* ]]; then
	echo "Found it."
	echo $hosttest
	test=1
  else
  	echo "Still looking for $1 at $(date)"
	sleep 60
  fi
done
  	

  
