# ILCTutorial
Reference: https://indico.fnal.gov/event/45413/contributions/196321/
and folked from https://github.com/ryonamin/ILCTutorial2021_Delphes

## 1) Download and build Delphes and LCIO
### To Do: 
```
$ ./1_build.sh
```

Following stdhep files are copied (or linked at KEKCC)
```
E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eL.pR.I106575.001.stdhep
E250-TDR_ws.P4f_zz_sl.Gwhizard-1_95.eR.pL.I106576.001.stdhep
E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eL.pR.I106479.001.stdhep
E250-TDR_ws.Pe2e2h.Gwhizard-1_95.eR.pL.I106480.001.stdhep
```

## 2) Setup environment (Delphes and LCIO)
### To Do: 
```
$ source 2_setup.sh
```

## 3) Run delphes 
### To Do: 
```
$ ./3_run.sh
```

Following LCIO files are created.
```
delphes_E250.P4f_zz_sl.eL.pR.slcio
delphes_E250.P4f_zz_sl.eR.pL.slcio
delphes_E250.Pe2e2h.eL.pR.slcio
delphes_E250.Pe2e2h.eR.pL.slcio
```

## 4) Run analysis code
### To Do:
```
$ root higgs_recoil_with_bkg.C
```
