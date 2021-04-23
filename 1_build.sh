#/bin/sh

# Setup compilers and ROOT
source /cvmfs/sft.cern.ch/lcg/views/LCG_97a/x86_64-centos7-gcc8-opt/setup.sh

# Install latest Delphes 
git clone https://github.com/delphes/delphes.git
pushd delphes/
	make -j 4
	export DELPHES_DIR=$PWD
	export PATH=$PATH:$DELPHES_DIR/bin
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DELPHES_DIR/lib
	popd

# Install latest LCIO (Data format for linear collider experiments) with delphes2lcio
git clone https://github.com/iLCSoft/LCIO.git
pushd LCIO
	export LCIO=$PWD
	export PATH=$PATH:$LCIO/bin
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LCIO/lib
	
	mkdir build
	pushd build
		cmake ..
		make -j 4 install
		popd
	
	pushd examples/cpp/delphes2lcio/
		mkdir build
		pushd build
			cmake -D LCIO_DIR=$LCIO ..
			make -j 4 install
			popd
		popd
	popd


# Install delphes2lcio

# Downlod example STDHEP files 
hostname=`hostname`
if [[ $hostname =~ cc.kek.jp ]] ;
then
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/higgs/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep .
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/higgs/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep .
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/4f/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep .
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/4f/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep .
else
	wget http://osggridftp02.slac.stanford.edu:8080/sdf/group/lcddata/ilc/prod/ilc/mc-dbd/generated/250-TDR_ws/higgs/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep
	wget http://osggridftp02.slac.stanford.edu:8080/sdf/group/lcddata/ilc/prod/ilc/mc-dbd/generated/250-TDR_ws/higgs/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep
	wget http://osggridftp02.slac.stanford.edu:8080/sdf/group/lcddata/ilc/prod/ilc/mc-dbd/generated/250-TDR_ws/4f/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep
	wget http://osggridftp02.slac.stanford.edu:8080/sdf/group/lcddata/ilc/prod/ilc/mc-dbd/generated/250-TDR_ws/4f/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep
fi
