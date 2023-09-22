#!/bin/bash
#
# Adds a password to nf-tower/docker-compose.yml
#
# Will not work on GHA
#
password=$(cat ~/Documents/smtp_password)
# echo ${password}
sed -i "s/iloverichel/${password}/" nf-tower/docker-compose.yml
