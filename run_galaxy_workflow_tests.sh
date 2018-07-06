#!/bin/bash
set -ex

: ${PLANEMO_OPTIONS:=""}  # e.g. PLANEMO_OPTIONS="--verbose"

GALAXY_URL="https://usegalaxy.eu"

# Run test.
planemo  $PLANEMO_OPTIONS test \
	--galaxy_url "$GALAXY_URL" \
	--galaxy_user_key "$GALAXY_USER_KEY" --no_shed_install \
	--engine external_galaxy \
	"$1"
