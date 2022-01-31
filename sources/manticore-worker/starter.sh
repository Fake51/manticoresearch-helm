#!/bin/sh

if [ ! -d "/var/lib/manticore/log" ]; then
  mkdir -p "/var/lib/manticore/log"
fi

if [ ! -d "/var/lib/manticore/data" ]; then
  mkdir -p "/var/lib/manticore/data"
fi

while [ -z "$(ls -A /var/lib/manticore/)" ]
do
  echo "Waiting for volume mount"
  sleep 1;
done

echo "Mount success"

php /etc/manticoresearch/replica.php &
exec searchd --force-preread --nodetach
