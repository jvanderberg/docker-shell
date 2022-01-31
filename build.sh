#!/bin/bash

if [ -f "config.env" ]; then
    echo "config.env exists."
    export $(cat config.env | xargs)
    echo 'Building' $username '...'
else
    echo 'What user name should be used? This will create /home/username.'
    read username
    echo username=$username > config.env
fi

docker volume create ${username}_home
sed 's/${username}/joshv/g' compose.template > docker-compose.yml
docker build --build-arg username=${username} -t ${username}/ubuntu:20.04 . 