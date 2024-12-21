#!/bin/bash

PROJECT_DIR=/opt/linera-project
cd $PROJECT_DIR

[ ! -d res-peer ] && git clone https://github.com/respeer-ai/res-peer
cd res-peer
git pull

mkdir -p /root/.config
source ~/.cargo/env
export PATH=/root/.cargo/bin/:$PATH

if [ -f /root/linera-project/linera/respeer/wallet_1.json ]; then
  linera service --port 30080 --listener-skip-process-inbox
else
  ./run_node_service.sh -N testnet-archimedes
fi
