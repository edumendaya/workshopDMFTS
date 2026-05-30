#!/bin/bash

wget https://github.com/edumendaya/workshopDMFTS/raw/refs/heads/main/modE2W.tpl
wget https://github.com/edumendaya/workshopDMFTS/raw/refs/heads/main/modE2W.est
wget https://github.com/edumendaya/workshopDMFTS/raw/refs/heads/main/modE2W_macOS.sh
ln -s ../fsc28-mac
ln -s ../../sfs/3pop_fold/fastsimcoal2/three_pop_MSFS.obs modE2W_MSFS.obs
chmod +x modE2W.sh

nohup ./modE2W.sh	

cat run{1..3}/modE2W/modE2W.bestlhoods
cat run{1..3}/modE2W/modE2W.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$14}' | sort -k 2
