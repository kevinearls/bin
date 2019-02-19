#!/usr/local/bin/bash

set -e
# Needed for filenames with spaces
IFS=$(echo -en "\n\b")

walk() 
{
    for filename in $1/* ; do
	if [ -d "${filename}" ] ; then
	    cd "${filename}"
	    if [ -f "pom.xml" ] ; then
		echo "Found pom in $filename"
	        mvn clean || true
	    else 
		walk "${filename}"
	    fi
	fi

    done
}

walk /Users/kevinearls/sources/



