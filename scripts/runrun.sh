#!/bin/bash

cd ../

HOSTFILE=hostfile.txt

MaxClique() {
  for i in {1..5}; do
      timeout 3600 mpiexec -n $1 -f $HOSTFILE ./build/install/bin/maxclique-16 -f test/brock800_1.clq --skel depthbounded -d 2 --hpx:threads 16  >> max_clique_scaling_depthbounded_$1.txt
      timeout 3600 mpiexec -n $1 -f $HOSTFILE ./build/install/bin/maxclique-16 -f test/brock800_1.clq --skel budget -b 10000000 --hpx:threads 16 >> max_clique_scaling_budget_$1.txt
      timeout 3600 mpiexec -n $1 -f $HOSTFILE ./build/install/bin/maxclique-16 -f test/brock800_1.clq --skel stacksteal --hpx:threads 16 >> max_clique_scaling_stacksteal_$1.txt
  done
}

NSHivert() {
	for i in {1..5}; do
		timeout 3600 mpiexec -n $1 -f $HOSTFILE ./build/install/bin/NS-hivert -g 51 --skel budget -b 10000000 --hpx:threads 16  >> ns_hivert_budget_$1.txt

		timeout 3600 mpiexec -n $1 -f $HOSTFILE ./build/install/bin/NS-hivert -g 51 --skel stacksteal --hpx:threads 16  >> ns_hivert_stack_steal_$1.txt
	done
}

SIP() {
	for i in {1..5}; do
		timeout 3600 ./build/install/bin/sip --pattern test/si/si2_bvg_b03m_800/si2_b03m_m800.03/pattern --target test/si/si2_bvg_b03m_800/si2_b03m_m800.03/target --skel depthbounded -d 2 --hpx:threads 16 >> sip_scaling_depthbounded_$1.txt

		timeout 3600 ./build/install/bin/sip --pattern test/si/si2_bvg_b03m_800/si2_b03m_m800.03/pattern --target test/si/si2_bvg_b03m_800/si2_b03m_m800.03/target --skel budget -b 100000 --hpx:threads 16 >> sip_scaling_budget_$1.txt
		
		timeout 3600 ./build/install/bin/sip --pattern test/si/si2_bvg_b03m_800/si2_b03m_m800.03/pattern --target test/si/si2_bvg_b03m_800/si2_b03m_m800.03/target --skel stacksteal --hpx:threads 16 >> sip_scaling_stacksteal_$1.txt
	
	done

}

appendToHostFile() {
  for i in $(seq $1 $2); do
    echo 130.209.255.$i >> hostfile.txt
  done
}

echo '130.209.255.3' > hostfile.txt 
SIP 1
appendToHostFile 2 2
SIP 2

exit 0
