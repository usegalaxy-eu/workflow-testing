#!/bin/bash
: ${PLANEMO_OPTIONS:=""}  # e.g. PLANEMO_OPTIONS="--verbose"

# Ensure we can find this history later.
nonce=$(date +%s)
history_name="$1 $nonce"

# Run test.
set +e # Do not die if planemo returns non-zero
planemo $PLANEMO_OPTIONS test \
	--history_name "$history_name" \
	--galaxy_url "https://usegalaxy.eu" \
	--galaxy_user_key "$GALAXY_USER_KEY" --no_shed_install \
	--engine external_galaxy \
	"$1";
planemo_exit_code=$?
set -e

history_id=$(parsec histories get_histories --name "$history_name" | jq -r .[0].id)
history_slug=$(parsec histories update_history --importable $history_id | jq -r .username_and_slug)
echo "History published at https://usegalaxy.eu/$history_slug"
exit $planemo_exit_code
