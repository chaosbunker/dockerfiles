#!/bin/sh

sed -i -e "s|<EMAIL>|${EMAIL}|g" /config/traefik.toml

# create cron task
crontab -r
# every hour
echo "0 * * * * /usr/local/bin/dumpcerts.sh /data/acme.json /data/certs" | crontab -

mkdir -p /data/certs

exec /bin/s6-svscan /etc/s6.d
