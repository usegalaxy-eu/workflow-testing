#!/bin/bash
DIRECTORIES=$(find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*')
for dir in $DIRECTORIES; do
	if [[ -f "$dir/urls.txt" ]]; then
		bash -c "cd $dir && wget --no-clobber --continue -i urls.txt"
	fi
done
