#!/bin/bash

: ${PLANEMO_TARGET:="planemo==0.50.1"}
: ${PLANEMO_OPTIONS:="--verbose"}
: ${PLANEMO_PROFILE_NAME:="wxflowtest"}
: ${PLANEMO_SERVE_PORT:="9019"}
: ${SERVE_GALAXY:="native"}  # Set to docker to use dockerized Galaxy, native to use Galaxy in current enviornment.
: ${PLANEMO_SERVE_DATABASE_TYPE:="postgres"}  # used if SERVE_GALAXY = native
: ${PLANEMO_DOCKER_GALAXY_IMAGE:="quay.io/bgruening/galaxy:18.01"}  # used if SERVE_GALAXY = "docker"

GALAXY_URL="http://localhost:$PLANEMO_SERVE_PORT"

if [ ! -d .venv ]; then
    virtualenv .venv
    . .venv/bin/activate
    pip install -U pip
    pip install "${PLANEMO_TARGET}"
fi

. .venv/bin/activate
if [ "$SERVE_GALAXY" = "native" ]; then
    planemo $PLANEMO_OPTIONS conda_init
    planemo $PLANEMO_OPTIONS profile_create \
        --database_type "$PLANEMO_SERVE_DATABASE_TYPE" \
        "$PLANEMO_PROFILE_NAME"
    planemo $PLANEMO_OPTIONS serve \
        --daemon \
        --profile "$PLANEMO_PROFILE_NAME" \
        --port "$PLANEMO_SERVE_PORT" \
        "$1"
else
    docker pull "${PLANEMO_DOCKER_GALAXY_IMAGE}"
    planemo $PLANEMO_OPTIONS serve \
        --daemon \
        --engine docker_galaxy \
        --docker_galaxy_image "${PLANEMO_DOCKER_GALAXY_IMAGE}" \
        --docker_extra_volume . \
        --port "$PLANEMO_SERVE_PORT" \
        "$1"
fi

planemo $PLANEMO_OPTIONS test \
        --galaxy_url "$GALAXY_URL" \
        --engine external_galaxy \
        "$1"
