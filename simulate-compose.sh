#!/usr/bin/env bash
# Simulate basic docker-compose actions without Docker.

# Load variables from .env if available
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

cat <<EOM
Would run the following commands:

mlflow server \
  --backend-store-uri mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@localhost:3306/${MYSQL_DATABASE} \
  --default-artifact-root ./mlruns \
  --host 0.0.0.0 --port ${MLFLOW_PORT:-5000}

# Start MySQL server (requires a local installation)
mysqld --user=${MYSQL_USER} --datadir=/var/lib/mysql

# Launch phpMyAdmin (requires a local installation)
phpmyadmin --port ${PHPADMIN_PORT:-8088}
EOM
