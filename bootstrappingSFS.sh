#!/bin/bash

PREFIX="three_pop"

# Get all lines with genomic data
zgrep -v "^#" $PREFIX.vcf > $PREFIX.allSites

# Get the header
zgrep "^#" $PREFIX.vcf > header

# get 100 files with 4338 sites each (number 101 removed due to only 90 sites)
split -l 2560 $PREFIX.allSites $PREFIX.sites.

# Generate 50 files each with randomly concatenated blocks and compute the SFS for each:
for i in {1..50}
do
  # Make a new folder for each bootstrapping iteration:
  mkdir bs$i
  cd bs$i

  # Add the header to our new bootstrapped vcf file
  cat ../header > $PREFIX.bs.$i.vcf
  # Randomly add 100 blocks
  for r in {1..100}
  do
    cat `shuf -n1 -e ../$PREFIX.sites.*` >> ${PREFIX}.bs.$i.vcf
  done
  # Compress the vcf file again
  gzip ${PREFIX}.bs.$i.vcf

  # Make an SFS from the new bootstrapped file
  ./easySFS.py -i ${PREFIX}.bs.$i.vcf.gz -p pop_file.txt -a -f --proj 47,48,45

  # Copy the observed SFS file into this folder renaming it to match the .tpl prefix
  ln -s ../${PREFIX}_MSFS.obs  ${PREFIX}.bs.${i}_MSFS.obs

  # Say that it is finished with iteration $i
  echo bs$i" ready"

  cd ..
done

# Modified from Mark Ravinet & Joana Meier (2021) https://speciationgenomics.github.io/fastsimcoal2
