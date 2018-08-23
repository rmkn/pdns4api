#!/bin/sh

KEY=${APIKEY:-pdns}
DBF=${DBFILE:-/tmp/pdns.db}

echo "select * from domains limit 1;" | sqlite3 $DBF
if [ $? -ne 0 ]; then
	curl -o /tmp/schema.sqlite3.sql -SL "https://raw.githubusercontent.com/PowerDNS/pdns/auth-4.1.1/modules/gsqlite3backend/schema.sqlite3.sql"
	sqlite3 $DBF < /tmp/schema.sqlite3.sql
	chmod 666 $DBF
	sed -i -e "s/^api-key=.*$/api-key=${KEY}/" /etc/pdns/pdns.conf
	sed -i -e "s/^gsqlite3-database=.*$/gsqlite3-database=${DBF//\//\\/}/" /etc/pdns/pdns.conf
fi

exec "$@"
