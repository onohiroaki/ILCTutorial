#/bin/sh
source /cvmfs/sft.cern.ch/lcg/releases/gcc/8.2.0-3fa06/x86_64-centos7/setup.sh
source /cvmfs/ilc.desy.de/sw/x86_64_gcc82_centos7/root/6.18.04/bin/thisroot.sh
export PATH="/cvmfs/ilc.desy.de/sw/x86_64_gcc82_centos7/CMake/3.15.5/bin:$PATH"
pushd delphes/
export DELPHES_DIR=$PWD
export PATH=$PATH:$DELPHES_DIR
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DELPHES_DIR
popd
pushd LCIO
export LCIO=$PWD
export PATH=$PATH:$LCIO/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$LCIO/lib:${LCIO}/lib64
popd
