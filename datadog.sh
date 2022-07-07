#!/bin/bash

if [ -f /etc/nginx/conf.d/nodejs.conf ]; then
  set-hostname -skip-apply frontend-dev
  sudo systemctl start nginx
  sudo systemctl enable nginx
fi

if [ -d /home/node ]; then
    set-hostname  spec-dev # -skip-apply
      sudo systemctl enable spec
      sudo systemctl start spec
fi

DD_API_KEY="db2fa345cffeb71eeac6db8317b4b29b" DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"