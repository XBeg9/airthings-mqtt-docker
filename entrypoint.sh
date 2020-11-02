#!/bin/bash

echo "Dumping env variables into /etc/environment"
printenv > /etc/environment

echo "Applying crontab"
crontab /etc/cron.d/crontab

echo "Running crontab"
cron -f
