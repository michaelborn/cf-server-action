#!/bin/sh

IMAGE_TAG=$1
SERVER_PORT=$2

# Probably best to use the full-blown commandbox image for hosting the server.
# CFML-CI-Tools works well for CLI tasks, not servers.
DOCKER_CONTAINER=ortussolutions/commandbox

# Important to set/override this for proper port mapping.
export BOX_SERVER_WEB_HTTP_PORT=8080

echo "Starting commandbox server instance"
echo "docker run --detach --publish $SERVER_PORT:8080 --volume $PWD:/app $DOCKER_CONTAINER:$IMAGE_TAG"

docker run \
    --detach \
    --publish $SERVER_PORT:8080 \
    --env PORT=8080 \
    --volume $PWD:/app \
    $DOCKER_CONTAINER:$IMAGE_TAG

sleep 5

curl http://127.0.0.1:$SERVER_PORT