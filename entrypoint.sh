#!/bin/bash
set -e

echo "Waiting for postgres..."

while ! nc -z db 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

rake db:create
rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
