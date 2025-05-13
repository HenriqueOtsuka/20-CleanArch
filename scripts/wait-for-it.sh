#!/bin/sh
# wait-for-it.sh from https://github.com/vishnubob/wait-for-it

set -e

host="$1"
shift
port="$1"
shift

timeout="${WAITFORIT_TIMEOUT:-30}"

while ! nc -z "$host" "$port"; do
  echo "Waiting for $host:$port..."
  sleep 1
done

exec "$@"
