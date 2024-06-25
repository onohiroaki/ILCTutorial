#/bin/sh

# Setup compilers
source /cvmfs/sft.cern.ch/lcg/releases/gcc/8.2.0-3fa06/x86_64-centos7/setup.sh
# Setup ROOT
source /cvmfs/ilc.desy.de/sw/x86_64_gcc82_centos7/root/6.18.04/bin/thisroot.sh
# Setup cmake 
export PATH="/cvmfs/ilc.desy.de/sw/x86_64_gcc82_centos7/CMake/3.15.5/bin:$PATH"

# Download latest Delphes 
git clone https://github.com/delphes/delphes.git
# Build Delphes 
pushd delphes/
	make -j 4
	export DELPHES_DIR=$PWD
	export PATH=$PATH:$DELPHES_DIR
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DELPHES_DIR
	popd

# Download latest LCIO (Data format for linear collider experiments) with delphes2lcio
git clone https://github.com/iLCSoft/LCIO.git
# Build and install LCIO 
pushd LCIO
	export LCIO=${PWD}
	export PATH=${PATH}:${LCIO}/bin
	export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}/lib:$LD_LIBRARY_PATH:$LCIO/lib64
	
	mkdir build
	pushd build
		cmake -DCMAKE_CXX_STANDARD=17 -DBUILD_ROOTDICT=ON -DCMAKE_INSTALL_PREFIX=${LCIO} ..
		make -j 4 install
		popd
	
	# Build and install delphes2lcio
	# delphes2lcio is an application of LCIO in which we call Delphes object and write LICO output.
	pushd examples/cpp/delphes2lcio/
		mkdir build
		pushd build
			cmake -D LCIO_DIR=${LCIO} ..
			make -j 4 install
			popd
		popd
	popd


# Downlod example STDHEP files 
#####################################
## File naming scheme
## E250  => sqrt(s) = 250 GeV 
## e2e2h => mu mu higgs process
## zz_sl => Z Z, semi-leptonic decays process
## eL.pR => beam porlarization: left handed for electrons, right handed for positrons
## eR.pL => beam porlarization: right handed for electrons, left handed for positrons
#####################################
hostname=`hostname`
if [[ $hostname =~ cc.kek.jp ]] ;
then
	# Use existing files for KEKCC users.
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/higgs/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep .
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/higgs/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep .
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/4f/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep .
	ln -s /gpfs/group/ilc/grid/storm/prod/ilc/mc-dbd/generated/250-TDR_ws/4f/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep .
else
	# Download for non KEKCC users.
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep
fi

# Change following option to true to download miniDST files
useMiniDST=false
# Select download source from DESY cloud or NDU server
fromDESY=false
if ${useMiniDST}; then
    if ${fromDESY}; then
	# Download miniDST files from DESY cloud server
	wget https://desycloud.desy.de/index.php/s/5LmrjGWqziQfMe7/download/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106479.Pe2e2h.eL.pR-00001-ILDminiDST.slcio
	wget https://desycloud.desy.de/index.php/s/3ZqPcGPELggW4bP/download/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106480.Pe2e2h.eR.pL-00001-ILDminiDST.slcio
	wget https://desycloud.desy.de/index.php/s/9gKznqtSGcBKBWY/download/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106575.P4f_zz_sl.eL.pR-00001-ILDminiDST.slcio
	wget https://desycloud.desy.de/index.php/s/3i3tj3adfMPfPaC/download/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106576.P4f_zz_sl.eR.pL-00001-ILDminiDST.slcio
    else
	# Download miniDST files from NDU server
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106479.Pe2e2h.eL.pR-00001-ILDminiDST.slcio
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106480.Pe2e2h.eR.pL-00001-ILDminiDST.slcio
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106575.P4f_zz_sl.eL.pR-00001-ILDminiDST.slcio
	wget https://ild.ngt.ndu.ac.jp/mc-prod/tutorial/rv01-16-p10_250.sv01-14-01-p00.mILD_o1_v05.E250-TDR_ws.I106576.P4f_zz_sl.eR.pL-00001-ILDminiDST.slcio
    fi
fi
