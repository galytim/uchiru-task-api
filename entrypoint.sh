#!/bin/bash
set -e

echo "Waiting for postgres..."
until pg_isready -h db -p 5432 -U postgres; do
  sleep 1
done
echo "PostgreSQL is ready"

exec "$@"
