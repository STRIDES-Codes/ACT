
# Improving Software FAIRness and Reproducibility with Automated Containerization of GitHub Repositories

![Logo](assets/ACT.png)

## What is ACT?
ACT or **A**utomated **C**ontainerization **T**ool is a Python package that leverages the container image builder [Dockta](https://github.com/stencila/dockta) to automate the containerization of R- and Python-based GitHub repositories.

## What is containerization?

## The problem of software FAIRness and Reproducibility

## Why should this issue be addressed? (Introduction)

## The AGCT Workflow

![Schematic](assets/ACT_Workflow.png)

## Installation, Setup and Execution
### Docker image
**ACT** has a pre-built docker image in [dockerhub](https://hub.docker.com/repository/docker/nciccbr/strides_act). Running **ACT** using this docker image is the easiest way to run docker. In order to run the **ACT** docker image all you need is the docker engine installed on your computer. Please follow the instructions on the docker's [website](https://docs.docker.com/engine/install/) to install docker engine.

Once, docker engine is install you can run **ACT** list this:

```
$ docker run  -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/data2 nciccbr/strides_act:v1.1.0 agct build --repo-url https://github.com/CCBR/AAsap.git --img-name ccbr_aasap --output /data2/AAsap
```

### Dockerfile

A local docker image can be built using the provided [Dockerfile](https://raw.githubusercontent.com/STRIDES-Codes/ACT/main/Dockerfile). You will need docker engine installed on your computer for building a docker image. Please follow the instructions on the docker's [website](https://docs.docker.com/engine/install/) to install docker engine.

Once you have a local copy of the Dockerfile and you have docker engine installed, you build the docker image list this:

```
$ docker build -f Dockerfile --no-cache -t strides_act .
```
If all goes well, you should be able to list the docker image *strides_act* using:
```
$ docker image ls
REPOSITORY    TAG    IMAGE ID    CREATED    SIZE
strides_act    <none>    32f43784742c    22 minutes ago    1.08GB
```


## PIP

# Usage

## Help menu:
```./agct -h```

## Build command (required arguments):
```./agct build --repo-url https://github.com/REPOSITORY/URL.git --img-name docker_image_name_lower_case --output ~/OP/DIRECTORY```

More options and help? ```./agct build -h```

## Push command (required arguments):
```./agct push --img-name docker_image_name_lower_case --registry DockerHub_UserName_OR_OrganizationName```

More options and help? ```./agct push -h```

## Input (URL)
## Output (Dockerfile)
## Image Registries

# How to cite
## Publication information and link

# Team Members:
* Steve Tsang
* Skyler Kuhn
* Vishal Koparde
* Austin J. Szuminsky
* Alec Peltekian
* Jason Xie
* Kimia Samieinejad
# License
MIT
