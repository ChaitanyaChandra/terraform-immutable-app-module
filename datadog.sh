#!/bin/bash

if [ -f /etc/nginx/conf.d/nodejs.conf ]; then
  set-hostname -skip-apply frontend-dev
fi

if [ -d /home/roboshop ]; then
    set-hostname -skip-apply spec-dev
fi

DD_API_KEY="db2fa345cffeb71eeac6db8317b4b29b" DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"