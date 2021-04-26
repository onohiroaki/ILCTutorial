#/bin/sh

# LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO command without arguments displays its usage.

# Execute delphes (DelphesSTDHEP2LCIO)
hostname=`hostname`
if [[ $hostname =~ cc.kek.jp ]] ;
then
bsub -q s -o submit_delphes_E250.Pe2e2h.eL.pR.log LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.Pe2e2h.eL.pR E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep
sleep 1
bsub -q s -o submit_delphes_E250.Pe2e2h.eR.pL.log LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.Pe2e2h.eR.pL E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep
sleep 1
bsub -q s -o submit_delphes_E250.P4f_zz_sl.eL.pR.log LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.P4f_zz_sl.eL.pR E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep
sleep 1
bsub -q s -o submit_delphes_E250.P4f_zz_sl.eR.pL.log LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.P4f_zz_sl.eR.pL E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep
else
LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.Pe2e2h.eL.pR E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep
LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.Pe2e2h.eR.pL E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep
LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.P4f_zz_sl.eL.pR E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep
LCIO/examples/cpp/delphes2lcio/bin/DelphesSTDHEP2LCIO delphes/cards/delphes_card_ILCgen.tcl delphes_E250.P4f_zz_sl.eR.pL E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep
fi
