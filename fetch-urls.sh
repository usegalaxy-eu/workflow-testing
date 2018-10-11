#!/bin/bash

# training workflows
git clone --depth=1 https://github.com/galaxyproject/training-material.git

process() {
	topic=$1
	tutorial=$2
}

for dir in $(find training-material -name '*-job.yml' | grep workflows | xargs dirname | sort -u); do
	topic=$(echo "$x" | awk -F/ '{print $4}')
	tutorial=$(echo "$x" | awk -F/ '{print $6}')

	mkdir -p training/${topic}/;
	cp -Rv $dir training/${topic}/${tutorial}/;
done

rm -rf training-material;

DIRECTORIES=$(find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*')
for dir in $DIRECTORIES; do
	if [[ -f "$dir/urls.txt" ]]; then
		bash -c "cd $dir && wget --no-clobber --continue -i urls.txt"
	fi
done
