#!/bin/bash
: ${PLANEMO_OPTIONS:=""}  # e.g. PLANEMO_OPTIONS="--verbose"

# Ensure we can find this history later.
nonce=$(date +%s)
history_name="$1 $nonce"

# Run test.
planemo  $PLANEMO_OPTIONS test \
	--history_name "$history_name"
	--galaxy_url "https://usegalaxy.eu" \
	--galaxy_user_key "$GALAXY_USER_KEY" --no_shed_install \
	--engine external_galaxy \
	"$1"
