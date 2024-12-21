#!/bin/bash

PROJECT_DIR=/opt/linera-project
cd $PROJECT_DIR

[ ! -d linera-dapps ] && git clone https://github.com/linera-hacker/linera-dapps.git
cd linera-dapps
git pull

source ~/.cargo/env
export PATH=/root/.cargo/bin/:$PATH
if [ -f /root/linera-project/linera/respeer/wallet_1.json ]; then
  ./run-local.sh -N testnet-archimedes -n 5
else
  ./deploy-applications.sh -N testnet-archimedes -n 5
  ./deploy-local.sh -N testnet-archimedes -n 5
fi
