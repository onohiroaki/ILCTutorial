#/bin/sh
source /cvmfs/sft.cern.ch/lcg/views/LCG_97a/x86_64-centos7-gcc8-opt/setup.sh
pushd delphes/
export DELPHES_DIR=$PWD
export PATH=$PATH:$DELPHES_DIR/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DELPHES_DIR/lib
popd
pushd LCIO
export LCIO=$PWD
export PATH=$PATH:$LCIO/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LCIO/lib
popd
