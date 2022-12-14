#!/bin/bash
sudo apt-get update && \
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs && \
sudo setcap cap_net_bind_service=+ep /usr/bin/node && \
sudo npm install pm2@latest serve@latest -g && \
mkdir -p ~/app && \
mv /tmp/build ~/app && \
mv /tmp/app.config.json ~/app && \
cd ~/app && \
sudo pm2 start app.config.json && \
sudo pm2 startup systemd && \
sudo pm2 save