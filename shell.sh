#!/bin/bash
export $(cat config.env | xargs)
echo 'Launching' $username '...'
docker run --network host -v ${PWD}/backup:/backup -v ${username}_home:/home/${username} -v /var/run/docker.sock:/var/run/docker.sock -ti -w /home/${username} ${username}/ubuntu:20.04 fish