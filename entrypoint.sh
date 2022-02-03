#!/bin/sh

IMAGE_TAG=$1
SERVER_PORT=$2

# Probably best to use the full-blown commandbox image for hosting the server.
# CFML-CI-Tools works well for CLI tasks, not servers.
DOCKER_CONTAINER=ortussolutions/commandbox

# Important to set/override this for proper port mapping.
export BOX_SERVER_WEB_HTTP_PORT=8080

echo "Pulling latest $DOCKER_CONTAINER:$IMAGE_TAG image"
docker pull $DOCKER_CONTAINER:$IMAGE_TAG

echo "Starting commandbox server instance"
echo "docker run --detach --publish $SERVER_PORT:8080 --volume $PWD:/app $DOCKER_CONTAINER:$IMAGE_TAG"
docker run \
    --publish $SERVER_PORT:8080 \
    --env PORT=8080 \
    --volume $PWD:/app \
    $DOCKER_CONTAINER:$IMAGE_TAG
    # --detach \

# sleep 10

# docker run --rm curlimages/curl:7.81.0 http://127.0.0.1:$SERVER_PORT/index.cfm