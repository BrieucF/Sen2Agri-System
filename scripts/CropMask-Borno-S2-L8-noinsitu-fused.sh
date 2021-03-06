#!/bin/sh

source ./set_build_folder.sh

./CropMaskFused.py \
    -pixsize 10 \
    -refr /mnt/archive/reference_data/ESACCI-LC-L4-LCCS-Map-300m-P5Y-2010-v1.6.1.tif \
    -outdir /mnt/data/archive/nigeria_borno/l4a/ \
    -input \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160607T134539_R136_V20160606T094258_20160606T094258.SAFE/S2A_OPER_SSC_L2VALD_32PQS____20160606.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160817T185332_R136_V20160815T093042_20160815T094108.SAFE/S2A_OPER_SSC_L2VALD_32PQS____20160815.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160607T044353_R136_V20160606T094258_20160606T094258.SAFE/S2A_OPER_SSC_L2VALD_32PQT____20160606.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160817T214327_R136_V20160815T093042_20160815T094108.SAFE/S2A_OPER_SSC_L2VALD_32PQT____20160815.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160607T134539_R136_V20160606T094258_20160606T094258.SAFE/S2A_OPER_SSC_L2VALD_32PRS____20160606.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160817T185332_R136_V20160815T093042_20160815T094108.SAFE/S2A_OPER_SSC_L2VALD_32PRS____20160815.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160607T044353_R136_V20160606T094258_20160606T094258.SAFE/S2A_OPER_SSC_L2VALD_32PRT____20160606.HDR \
        /mnt/archive/test/Borno_South/S2A_OPER_PRD_MSIL2A_PDMC_20160817T214327_R136_V20160815T093042_20160815T094108.SAFE/S2A_OPER_SSC_L2VALD_32PRT____20160815.HDR \
        /mnt/archive/test/Borno_South/LC81860522016182LGN00_L2A/L8_TEST_L8C_L2VALD_186052_20160630.HDR \
        /mnt/archive/test/Borno_South/LC81860532016182LGN00_L2A/L8_TEST_L8C_L2VALD_186053_20160630.HDR \
    -buildfolder "$BUILD_FOLDER"
