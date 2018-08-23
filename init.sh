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
# api-logfile   Location of the server logfile (used by the REST API)
# api-logfile=/var/log/pdns.log
# disable-syslog        Disable logging to syslog, useful when running inside a supervisor that logs stdout
# disable-syslog=no
# log-dns-details       If PDNS should log DNS non-erroneous details
# log-dns-details=no
# log-dns-queries       If PDNS should log all incoming DNS queries
log-dns-queries=yes
# log-timestamp Print timestamps in log lines
# log-timestamp=yes
# logging-facility      Log under a specific facility
# logging-facility=
# loglevel      Amount of logging. Higher is more. Do not set below 3
loglevel=6
# query-logging Hint backends that queries should be logged
# query-logging=no
# edns-subnet-processing        If we should act on EDNS Subnet options
edns-subnet-processing=yes
EOS
