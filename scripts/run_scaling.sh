#!/bin/bash

if [ $# != 2 ]
  then
    echo "Incorrect number of arguments supplied. Please provide 2"
    exit 1
fi

MaxClique() {

  INSTANCE=$1
  D=$2
  B=$3
  NPROCESSES=$4

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/maxclique-16 -f $INSTANCE --skel depthbounded -d $D --hpx:threads 8 >> max_clique_scaling_depthbounded.txt
  done

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/maxclique-16 -f $INSTANCE --skel budget -b $B --hpx:threads 8 >> max_clique_scaling_budget.txt
  done

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/maxclique-16 -f $INSTANCE --skel stacksteal --chunked --hpx:threads 8 >> max_clique_scaling_stacksteal.txt
  done

}

NSHivert() {

  G=$1
  D=$2
  B=$3
  NPROCESSES=$4
  HOSTFILE=$5

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/NS-hivert -g $G --skel depthbounded -d $D >> ns-hivert_scaling_depthbounded.txt
  done

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/NS-hivert -g $G --skel budget -b $B >> ns-hivert_scaling_budget.txt
  done

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/NS-hivert -g $G --skel stacksteal --chunked >> ns-hivert_scaling_stacksteal.tzt
  done

}


Sip() {

  PATTERN=$1
  TARGET=$2
  D=$3
  B=$4
  NPROCESSES=$5

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/sip --pattern $PATTERN --target $TARGET --skel depthbounded -d $D >> sip_scaling_depthbounded.txt
  done

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/sip --pattern $PATTERN --target $TARGET --skel budget -b $B >> sip_scaling_budget.txt
  done

  for i in {1..5}; do
    mpiexec -n $NPROCESSES -f $HOSTFILE ./build/install/bin/sip --pattern $PATTERN --target $TARGET --skel stacksteal --chunked >> sip_scaling_stacksteal.txt
  done

}
