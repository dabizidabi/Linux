#!/bin/bash

#display all files in directory

ls -l | tail -n +2 |
while read attr links owner group size date file filename; do
	cat <<- EOF
		Filename: $filename
		Size: $size
		Owner: $owner
		Group: $group
		Date: $date $time
		Links: $links
		Attrib: $attr
	EOF
done
		
