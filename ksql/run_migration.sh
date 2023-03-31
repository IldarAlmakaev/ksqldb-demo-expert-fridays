#!/bin/bash

echo -e "\n\n 1. Initializing metadata \n"
/usr/bin/ksql-migrations --config-file ${KSQL_MIGRATION_PROJECT_FOLDER}/ksql-migrations.properties initialize-metadata

echo -e "\n\n 2. Checks. Getting migrations BEFORE apply... \n"
/usr/bin/ksql-migrations --config-file ${KSQL_MIGRATION_PROJECT_FOLDER}/ksql-migrations.properties info

echo -e "\n\n 3. Checks. Validate new migration(s) BEFORE apply \n"
/usr/bin/ksql-migrations --config-file ${KSQL_MIGRATION_PROJECT_FOLDER}/ksql-migrations.properties validate

echo -e "\n\n 4. Applying migration(s)... \n"
/usr/bin/ksql-migrations --config-file ${KSQL_MIGRATION_PROJECT_FOLDER}/ksql-migrations.properties apply --all

echo -e "\n\n 5. Checks. Getting migrations state AFTER apply... \n"
/usr/bin/ksql-migrations --config-file ${KSQL_MIGRATION_PROJECT_FOLDER}/ksql-migrations.properties