#!/bin/bash

PREFIX="modW2E" # Change the prefix according to the .tpl .est and .obs files

for i in {1..3}
 do
   mkdir run$i
   cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_MSFS.obs fsc28 run$i"/"
   cd run$i
   ./fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -0 -C 10 -n 20000 -L 40 -s 0 -M -q -c 12 --multiSFS
   rm -r ${PREFIX}_MSFS.obs
   cd ..
 done
