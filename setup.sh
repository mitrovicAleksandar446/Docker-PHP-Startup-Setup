#!/usr/bin/env bash

echo "Starting Docker..."

export MSYS_NO_PATHCONV=1;
docker-compose up --build -d