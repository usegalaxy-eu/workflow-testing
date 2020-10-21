#!/bin/bash

# if GALAXY_URL and GALAXY_USER_KEY are not set, try to set them from local untracked file
[ ! $GALAXY_URL ] || [ ! $GALAXY_USER_KEY ] && source .secret.env
export GALAXY_URL GALAXY_USER_KEY

virtualenv -p python3 .venv; . .venv/bin/activate
pip install -r requirements.txt

# initalise parsec with url and api key.  Remove any existing parsec configuration stored in the home directory
rm -f ~/.parsec.yml ||:
parsec init --url $GALAXY_URL --api_key $GALAXY_USER_KEY # caution: if ~/.parsec.yml already exists at this point it will not be updated

workflow_list=workflows_to_test.txt
# # get list of local workflows with tests (ignoring training folder)
find . \( -name '*-test.yml' ! -path './training*' \) | sed 's/^\.\///g' | sed 's/-test.yml/.ga/g' > $workflow_list

# # clone training-material repo
git clone --depth 1 https://github.com/galaxyproject/training-material.git

# # get list of training-material workflows with tests
find 'training-material' -path '*-test.yml' | sed 's/-test.yml/.ga/g' >> $workflow_list

[ -d test_output ] && rm -rf test_output
mkdir test_output

# run test for each workflow and store json report
cat $workflow_list | while read line || [[ -n $line ]]; do
   ./run_galaxy_workflow_tests.sh $line
   mv test_output.json test_output/$(sed 's/\//__/g' <<< $line).test_output.json
   mv history.html test_output/$(sed 's/\//__/g' <<< $line).history.html
done

# merge json reports and create html report from merged report
find 'test_output' -name '*test_output.json' -exec sh -c 'planemo merge_test_reports "$@" test_output/merged_test_output.json' sh {} +
planemo test_reports test_output/merged_test_output.json  --test_output merged_test_output.html

