#!/bin/bash

: ${PLANEMO_TARGET:="planemo==0.49.2"}
: ${PLANEMO_OPTIONS:="--verbose"}
: ${PLANEMO_PROFILE_NAME:="wxflowtest"}
: ${PLANEMO_SERVE_PORT:="9019"}
: ${PLANEMO_SERVE_DATABASE_TYPE:="postgres"}

GALAXY_URL="http://localhost:$PLANEMO_SERVE_PORT"

if [ ! -f .venv ]; then
    virtualenv .venv
    . .venv/bin/activate
    pip install -U pip
    pip install "${PLANEMO_TARGET}"
fi

. .venv/bin/activate
planemo $PLANEMO_OPTIONS conda_init
planemo $PLANEMO_OPTIONS profile_create \
        --database_type "$PLANEMO_SERVE_DATABASE_TYPE" \
        "$PLANEMO_PROFILE_NAME"
planemo $PLANEMO_OPTIONS serve \
        --daemon \
        --profile "$PLANEMO_PROFILE_NAME" \
        --port "$PLANEMO_SERVE_PORT" \
        "$1"
planemo $PLANEMO_OPTIONS test \
        --galaxy_url "$GALAXY_URL" \
        --engine external_galaxy \
        "$1"
