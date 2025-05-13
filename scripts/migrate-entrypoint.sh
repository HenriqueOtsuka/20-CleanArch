#!/bin/sh

set -e

echo "🕐 Aguardando MySQL ficar disponível..."

until nc -z mysql 3306; do
  echo "⏳ MySQL não está pronto, aguardando..."
  sleep 2
done

echo "✅ MySQL disponível, rodando migrações..."
/migrate -path=/migrations -database "mysql://root:root@tcp(mysql:3306)/orders" -verbose up
