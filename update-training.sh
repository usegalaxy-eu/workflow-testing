#!/bin/bash
clone(){
	# fetch all training workflows
	git clone --depth=1 https://github.com/galaxyproject/training-material.git
}
update_workflows() {
	rm -rf training;

	# For each -job.yml file, extract that workflows directory
	for dir in $(find training-material/ -name '*-job.yml' | grep workflows | xargs dirname | sort -u); do
		topic=$(echo "$dir" | awk -F/ '{print $3}')
		tutorial=$(echo "$dir" | awk -F/ '{print $5}')

		# into a nicer training/topic/tutorial/ dir
		echo $dir $topic $tutorial
		mkdir -p training/${topic}/;
		cp -R $dir training/${topic}/${tutorial}/;
	done
}

notify() {
	echo "Please register or add the following:"
	echo
	find training -name '*-test.yml' | sed 's/-test.yml/.ga/'
	echo
	echo "And add the following to the readme:"
	echo

	for training in $(find training -name '*-test.yml' | sed 's/-test.yml/.ga/' | sort); do
		training_escape=$(echo $training | sed 's|/|%2F|g')
		echo "$training |  [![Build Status](https://build.galaxyproject.eu/job/usegalaxy-eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=${training_escape}/badge/icon)](https://build.galaxyproject.eu/job/usegalaxy-eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=${training_escape}/)"
	done
}


#clone
#update_workflows
notify
