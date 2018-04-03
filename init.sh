#!/bin/sh

sed -i -e "s/^launch=/#launch=/" /etc/pdns/pdns.conf

cat << EOS >> /etc/pdns/pdns.conf
version-string=anonymous
launch=gsqlite3
gsqlite3-database=/tmp/pdns.db
api=yes
api-key=pdns
webserver=yes
webserver-address=0.0.0.0
webserver-allow-from=0.0.0.0/0
EOS
