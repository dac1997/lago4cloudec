# Taken from  LAGO onedataSim : packed tools for [ARTI](https://github.com/lagoproject/arti)
## Description


encourages, we started from this package to perform our simulations

## Pre-requisites

2. Had [Docker](https://www.docker.com/) (or [Singularity](https://singularity.lbl.gov/) or [udocker](https://pypi.org/project/udocker/)) installed on your PC (or HPC/HTC facility) 



On linux, the recommended way is to remove all docker packages included by default in your distro and to make use of Docker repositories.

For example, for a Debian based distribution such as Ubuntu:
```sh
  sudo apt-get remove docker wmdocker docker-registry [...etc...]
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/debian"
  sudo apt-get install docker-ce docker-ce-cli containerd.io
```

On CentOS 7 with root:

```sh 
  yum remove docker docker-client docker-[...etc...] 
  # check first if centos7-extras is enabled
  yum update
  yum install -y yum-utils 
  yum-config-manager  --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
  yum update
  yum install docker-ce docker-ce-cli containerd.io
  systemctl enable docker
  systemctl start docker
```



## Building the container

Example build

  docker build --no-cache --build-arg PASS_FOR_LAGO_CORSIKA=<password> -t lagoecuadorcloudsim https://github.com/dac1997/lago4cloud.git


## Executing a stardandised simulation & analisys to be stored in OneData repositories for LAGO

This automatised execution is the preferred one in LAGO collaboration.

You can execute do_sims_onedata.py or do_analysis_onedata.py in a single command, without the needed of log into the container. If there is a lack of paramenters, it prompts you for them, if not this starts and the current progress is shown while the results are automatically stored in OneData. 

1. Simple command example:

```sh
sudo docker run --privileged  -e  ONECLIENT_ACCESS_TOKEN="<personal onedata token>" \
                -e ONECLIENT_PROVIDER_HOST="<nearest onedata provider>" \ 
                -it <container name> bash -lc "do_sims_onedata.py <ARTI do_* params>"
```

```sh
sudo docker run --privileged  -e  ONECLIENT_ACCESS_TOKEN="MDAxY2xv...iXm8jowGgo" \
                -e ONECLIENT_PROVIDER_HOST="mon01-tic.ciemat.es" \
                -it lagocontainer:0.0.1  bash -lc "do_sims_onedata.py -t 10 -u 0000-0001-6497-753X -s sac -k 2.0e2 -h QGSII"
```
```

Final Purpose is to run on Cloud based servers






