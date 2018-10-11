#!/bin/bash
clone(){
	# fetch all training workflows
	git clone --depth=1 https://github.com/galaxyproject/training-material.git
}
update_workflows() {
	rm -rf training;

	# For each -job.yml file, extract that workflows directory
	for dir in $(find training-material/ -name '*-job.yml' | grep workflows | xargs dirname | sort -u); do
		topic=$(echo "$x" | awk -F/ '{print $4}')
		tutorial=$(echo "$x" | awk -F/ '{print $6}')

		# into a nicer training/topic/tutorial/ dir
		mkdir -p training/${topic}/;
		cp -R $dir training/${topic}/${tutorial}/;
	done
}

identify_workflows() {
	find training -name '*-test.yml' | sed 's/-test.yml/.ga/'
}


#clone
update_workflows

echo "Please register or add the following:"
identify_workflows
