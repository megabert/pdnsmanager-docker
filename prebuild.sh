#!/bin/bash

set_dockerfile_vars() {
	while read ignore v1 v2;do
		if [ -z "$v2" ] ;then
			eval $v1
		else
			eval $v1=\"$v2\"
		fi
	done < <(grep "^ENV" Dockerfile)
}

set_dockerfile_vars

[ -d files/archive ] || mkdir files/archive 

if ! [ -s files/archive/$PDNSMANAGER_ARCHIVE ] ; then
	echo "Downloading $PDNSMANAGER_DOWNLOAD_URL..."
       	wget -q -O "files/archive/$PDNSMANAGER_ARCHIVE" "$PDNSMANAGER_DOWNLOAD_URL"
else
	echo "$PDNSMANAGER_ARCHIVE already exists locally"
fi
