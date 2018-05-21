#!/bin/bash

mysql=( mysql -uroot -hlocalhost )

if [ ! -z "$MYSQL_ROOT_PASSWORD" ]; then
    mysql+=( -p"${MYSQL_ROOT_PASSWORD}" )
fi

if [ "$MYSQL_DATABASE_WILDCARD" ]; then
    echo "REVOKE ALL PRIVILEGES, GRANT OPTION FROM $MYSQL_USER ;" | "${mysql[@]}"
    echo "GRANT ALL ON \`$MYSQL_DATABASE_WILDCARD\`.* TO '$MYSQL_USER'@'%' ;" | "${mysql[@]}"
fi

echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"