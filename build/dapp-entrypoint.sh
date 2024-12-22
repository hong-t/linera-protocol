#!/bin/bash

PROJECT_DIR=/opt/linera-project
cd $PROJECT_DIR

[ ! -d linera-dapps ] && git clone https://github.com/linera-hacker/linera-dapps.git
cd linera-dapps
git pull
sed -i "/read -p*/c sleep 100000000" ./deploy-local.sh
sed -i "/read -p*/c sleep 100000000" ./run-local.sh

sed -i "s/WALLET_10_PUBLIC_IPORT=.*/WALLET_10_PUBLIC_IPORT='localhost:30090'/g" ./run-local.sh
sed -i "s/WALLET_11_PUBLIC_IPORT=.*/WALLET_11_PUBLIC_IPORT='localhost:30091'/g" ./run-local.sh
sed -i "s/WALLET_12_PUBLIC_IPORT=.*/WALLET_12_PUBLIC_IPORT='localhost:30092'/g" ./run-local.sh
sed -i "s/WALLET_13_PUBLIC_IPORT=.*/WALLET_13_PUBLIC_IPORT='localhost:30093'/g" ./run-local.sh
sed -i "s/WALLET_14_PUBLIC_IPORT=.*/WALLET_14_PUBLIC_IPORT='localhost:30094'/g" ./run-local.sh
sed -i "s/BLOB_GATEWAY_PUBLIC_IPORT=.*/BLOB_GATEWAY_PUBLIC_IPORT='blobgateway.hk-testnet.blobgateway.com'/g" ./run-local.sh
sed -i "s/LOCAL_IP=.*/LOCAL_IP='localhost'/g" ./run-local.sh

sed -i "s/WALLET_10_PUBLIC_IPORT=.*/WALLET_10_PUBLIC_IPORT='localhost:30090'/g" ./deploy-local.sh
sed -i "s/WALLET_11_PUBLIC_IPORT=.*/WALLET_11_PUBLIC_IPORT='localhost:30091'/g" ./deploy-local.sh
sed -i "s/WALLET_12_PUBLIC_IPORT=.*/WALLET_12_PUBLIC_IPORT='localhost:30092'/g" ./deploy-local.sh
sed -i "s/WALLET_13_PUBLIC_IPORT=.*/WALLET_13_PUBLIC_IPORT='localhost:30093'/g" ./deploy-local.sh
sed -i "s/WALLET_14_PUBLIC_IPORT=.*/WALLET_14_PUBLIC_IPORT='localhost:30094'/g" ./deploy-local.sh
sed -i "s/BLOB_GATEWAY_PUBLIC_IPORT=.*/BLOB_GATEWAY_PUBLIC_IPORT='blobgateway.hk-testnet.blobgateway.com'/g" ./deploy-local.sh
sed -i "s/LOCAL_IP=.*/LOCAL_IP='localhost'/g" ./run-local.sh

source ~/.cargo/env
export PATH=/root/.cargo/bin/:$PATH
if [ -d /root/linera-project/linera/dapps ]; then
  ./run-local.sh -N testnet-archimedes -n 5
else
  ./deploy-local.sh -N testnet-archimedes -n 5 -k 1
fi
