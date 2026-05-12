//Parameters for the coalescence simulation program : fastsimcoal.exe: mod N2S
3 samples to simulate :
//Population effective sizes (number of genes)
WES    // pop0
CEN    // pop1
EST    // pop2
//Samples sizes and samples age
47
48
45
//Growth rates : negative growth implies population expansion
0
0
0
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
6 historical event
HOL1$ 0 0 0 PRM$ 0 0     // pop0 change Ne
HOL2$ 1 1 0 SGN$ 0 0     // pop1 change Ne
HOL3$ 2 2 0 TRC$ 0 0     // pop2 change Ne
SPL1$ 2 1 1 1 0 0        // pop2 split from pop1 by colonization
SPL2$ 1 0 1 1 0 0        // pop1 split from pop0 by colonization
WIS 0 0 0 ANC$ 0 0       // pop0 change Ne
//Number of independent loci [chromosome]
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 2.7e-8
