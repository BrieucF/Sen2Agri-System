#!/bin/bash
#set -x #echo on

##
## SCRIPT: INSTALL AND CONFIGURE PLATFORM SEN2AGRI CORE
##
##
## SCRIPT STEPS
##     - INSTALL OTB, GDAL, SEN2AGRI PROCESSORS
################################################################################################
## SCRIPT USAGE:
##
## open a terminal go into delivery install_script folder:
## cd /path/to/install_script
## sudo ./sen2agriPlatormInstallAndConfigCore.sh
################################################################################################
: ${SYS_ACC_NAME:="sen2agri-service"}
#-----------------------SEN2AGRI RPMS------------------------------------------------------#
SEN2AGRI_CUR_VER="1.4"
SEN2AGRI_PROCESSORS_RPM="../rpm_binaries/sen2agri-processors-${SEN2AGRI_CUR_VER}.centos7.x86_64.rpm"
#-----------------------------------------------------------------------------------------#
function create_system_account()
{
   #create system account for running services
   adduser -m ${SYS_ACC_NAME}
}
#-----------------------------------------------------------#
function install_RPMs()
{
   ##########################################################
   ####  OTB, GDAL, SEN2AGRI-PROCESSORS, SEN2AGRI-SERVICES
   ##########################################################
   ##install EPEL for packages dependencies installation
   yum -y install epel-release
   yum -y localinstall http://yum.postgresql.org/9.4/redhat/rhel-7.2-x86_64/pgdg-centos94-9.4-2.noarch.rpm

   ##install cifs-utils package
   yum -y install cifs-utils

   ##install Orfeo ToolBox
   yum -y install ../rpm_binaries/otb-*.rpm

   ##install GDAL library
   yum -y install ../rpm_binaries/gdal-local-*.rpm

   ##install Sen2Agri Processors
   yum -y install ${SEN2AGRI_PROCESSORS_RPM}

   echo /usr/local/lib > /etc/ld.so.conf.d/local.conf
   ln -s /usr/lib64/libproj.so.0 /usr/lib64/libproj.so
   ldconfig
}
###########################################################
##### MAIN                                              ###
###########################################################

#-----------------------------------------------------------#
####  OTB, GDAL, SEN2AGRI PROCESsORS INSTALL  & CONFIG ######
#-----------------------------------------------------------#
## install binaries
install_RPMs

## create system account
create_system_account

