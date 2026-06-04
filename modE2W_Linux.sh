#!/bin/bash

PREFIX="modE2W" # Change the prefix according to the .tpl .est and .obs files

for i in {1..3}
 do
   mkdir run$i
   cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_MSFS.obs fsc28 run$i"/"
   cd run$i
   ./fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -0 -C 10 -n 10000 -L 30 -s 0 -M -q -c 0 --multiSFS
   rm -r ${PREFIX}_MSFS.obs
   cd ..
 done


# Modified from Mark Ravinet & Joana Meier (2021) https://speciationgenomics.github.io/fastsimcoal2
