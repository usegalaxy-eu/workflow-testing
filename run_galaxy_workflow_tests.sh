#!/bin/bash
: ${PLANEMO_OPTIONS:=""}  # e.g. PLANEMO_OPTIONS="--verbose"

# Run test.
planemo  $PLANEMO_OPTIONS test \
	--galaxy_url "https://usegalaxy.eu" \
	--galaxy_user_key "$GALAXY_USER_KEY" --no_shed_install \
	--engine external_galaxy \
	"$1"
