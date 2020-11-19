################################################################################
# Original Author: A.J. Rubio-Montero (http://orcid.org/0000-0001-6497-753X),  #
#          CIEMAT - Sci-Track Group (http://rdgroups.ciemat.es/web/sci-track), #
#          for the EOSC-Synergy project (EU H2020 RI Grant No 857647).         #
# License (SPDX): BSD-3-Clause (https://opensource.org/licenses/BSD-3-Clause)  #
# Copyright (c): 2020-today, The LAGO Collaboration (http://lagoproject.net)   #
################################################################################

FROM centos:7.8.2003

#PassWord For LAGO repo
ARG PASS_FOR_LAGO_CORSIKA

RUN yum -y update

# CORSIKA pre-requisites
RUN yum -y install gcc gcc-c++ gcc-gfortran \
        curl csh make perl perl-Data-Dumper \
        git perl-Switch

#Install CORSIKA from LAGO repository
RUN git clone https://lagoproject:$PASS_FOR_LAGO_CORSIKA@bitbucket.org/lagoproject/lago-corsika.git /opt/corsika-75600-lago

RUN cd /opt/corsika-75600-lago && ./coconut -b

## testing corsika
## ./corsika75600Linux_QGSII_gheisha < all-inputs > output.txt


#dowload and compile ARTI LAGO crktools
RUN yum -y install bzip2
# we use arti package modified for our docker 
RUN cd /opt && git clone https://github.com/dac1997/arti4docker.git 

#getfacl getfattr 
RUN yum -y install acl attr 

# xattr
RUN yum -y install epel-release
RUN yum -y install  python2-pip python-devel libffi-devel 
RUN pip install --upgrade pip
RUN pip install xattr

#python3 and libraries for Lago processing with onedata
RUN yum -y install python3 python36-pyxattr

RUN yum -y install gnuplot
RUN yum -y install screen
RUN yum -y install emacs

WORKDIR /opt/corsika-75600-lago/run
#ENTRYPOINT /opt/arti/sims/do_datahub.sh
CMD bash
