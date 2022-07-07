#!/bin/bash

if [ -f /etc/nginx/conf.d/nodejs.conf ]; then
  hostnamectl set-hostname frontend-dev
fi

if [ -d /home/node ]; then
  hostnamectl set-hostname spec-dev
fi

DD_API_KEY="db2fa345cffeb71eeac6db8317b4b29b" DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"