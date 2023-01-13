#!/usr/bin/env bash
######################################################################
# @author      : Linus Fernandes (linusfernandes at gmail dot com)
# @file        : until
# @created     : Friday Jan 13, 2023 16:49:57 IST
#
# @description : 
######################################################################

num=1
until [ $num -gt 10 ]; do
	echo $(($num * 3))
	num=$(($num+1))
done
