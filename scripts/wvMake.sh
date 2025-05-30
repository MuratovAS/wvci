#!/bin/bash

git config --global --add safe.directory '*'

OUTPUT_DIR=${OUTPUT_DIR:-"build"}
PRJ_VERSION=${PRJ_VERSION:-"git"}

if [[ ! -z "$@" ]]; then
	FILES="$@"; 
else
	FILES=$( git diff --name-only HEAD~1 | grep '\.yml' | grep -v ".git" | tr '\n' ' ');
fi

for arg in $FILES
do
	FILE=`realpath $arg`
	OUTPUT_DIR=`realpath $OUTPUT_DIR`
	
	if [ ! -f "$FILE" ]; then
	    echo "$FILE not found!"
	    continue;
	fi

	echo "Сompilation: $FILE"
	
	mkdir -p $OUTPUT_DIR
	
	if [ "$PRJ_VERSION" == "git" ]; then
		PRJ_VERSION="`git log --date=format:'%Y%m%d%H' --pretty=tformat:"%h [%cd]" $FILE | head -n1`"
		if [[ ! -z "$PRJ_VERSION" ]]; then
			PRJ_VERSION="git:$PRJ_VERSION"
		else
			PRJ_VERSION=""
		fi
	fi
	
	sed -i "s/vV.V.V-VVV/'$PRJ_VERSION'/g" $FILE
	wireviz -f hp -o $OUTPUT_DIR $FILE; 
	sed -i "s/'$PRJ_VERSION'/vV.V.V-VVV/g" $FILE
done
