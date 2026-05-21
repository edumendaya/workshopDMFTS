#!/bin/bash

for bs in {1..50}
do
  cd bs$bs
  # Run fastsimcoal 100 times:
  for i in {1..100}
  do
    mkdir run$i
    cd run$i
    cp ${PREFIX}.bs.$bs.* ./
    fastsimcoal2 -t ${PREFIX}.bs.$bs.tpl -e ${PREFIX}.bs.$bs.est -m -0 -C 10 -n 10000 -L 40 -s0 -M -q
    cd ..
  done
  # Find the best run:
  fsc-selectbestrun.sh

  cd ..
done

# Script from Mark Ravinet & Joana Meier (2021) https://speciationgenomics.github.io/fastsimcoal2