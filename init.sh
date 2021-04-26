#!/bin/sh

sed -i -e "s/^launch=/#launch=/" /etc/pdns/pdns.conf

cat << EOS >> /etc/pdns/pdns.conf
version-string=anonymous

# sqlite
launch=gsqlite3
gsqlite3-database=/tmp/pdns.db

# # bind
# launch=bind
# bind-config=/etc/named.conf
# bind-check-interval=60
# bind-ignore-broken-records=yes

api=yes
api-key=pdns
webserver=yes
webserver-address=0.0.0.0
webserver-allow-from=0.0.0.0/0

disable-axfr=yes

edns-subnet-processing=yes

expand-alias=yes
resolver=8.8.8.8
EOS
