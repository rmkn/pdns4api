#!/bin/sh

echo "select * from domains limit 1;" | sqlite3 /tmp/pdns.db
if [ $? -ne 0 ]; then
	curl -o /tmp/schema.sqlite3.sql -SL "https://raw.githubusercontent.com/PowerDNS/pdns/auth-4.1.1/modules/gsqlite3backend/schema.sqlite3.sql"
	sqlite3 /tmp/pdns.db < /tmp/schema.sqlite3.sql
	chmod 666 /tmp/pdns.db
	sed -i -e "s/^api-key=.*$/api-key=${APIKEY}/" /etc/pdns/pdns.conf
fi

exec "$@"
