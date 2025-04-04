#!/bin/bash
echo "Creating DB '$POSTGRES_DB' and schema '$POSTGRES_SCHEMA' with user '$POSTGRES_USER'"

psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}<<-END
    ALTER ROLE ${POSTGRES_USER} SET client_encoding TO 'utf8';
    ALTER ROLE ${POSTGRES_USER} SET default_transaction_isolation TO 'read committed';
    ALTER ROLE ${POSTGRES_USER} SET timezone TO 'UTC';
    ALTER USER ${POSTGRES_USER} CREATEDB;
    CREATE DATABASE ${POSTGRES_DB};
    GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_USER};
    CREATE SCHEMA IF NOT EXISTS ${POSTGRES_SCHEMA}
END
