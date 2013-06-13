#! /bin/csh
#
# Modify SFrame config
cd ${_CONDOR_SCRATCH_DIR}
cp -r /uscms/home/yumiceva/work/sframe/CMSSW_5_3_3/src/SFrame/FITAnalysis/config .
cp config/FourtopsPreSelectionCycleMuons_config.xml .
python replace.py "{CONDOR}" ${_CONDOR_SCRATCH_DIR} FourtopsPreSelectionCycleMuons_config.xml temp.xml
cp temp.xml config/.
cd config
# Source version of CMSSW associated to SFRAME
source /uscmst1/prod/sw/cms/cshrc uaf
cd /uscms/home/yumiceva/work/sframe/CMSSW_5_3_3/src
eval `scramv1 runtime -csh`
cd /uscms/home/yumiceva/work/sframe/CMSSW_5_3_3/src/SFrame 
source setup.csh
setenv FASTJETDIR /uscms/home/yumiceva/work/sframe/fastjet/3.0.2-install/lib
setenv LD_LIBRARY_PATH ${FASTJETDIR}/lib:${LD_LIBRARY_PATH}
setenv LD_LIBRARY_PATH ${SFRAME_DIR}/SFrameTools/JetMETObjects/lib:${LD_LIBRARY_PATH}
# Run the sframe job
cd ${_CONDOR_SCRATCH_DIR}/config
sframe_main temp.xml
cd ${_CONDOR_SCRATCH_DIR}
rm -r config
