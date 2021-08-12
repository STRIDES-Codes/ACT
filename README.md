## Introduction
Improving the findability, accessibility, interoperability and reusability is a key component in moving towards greater reproducibility in computational biomedical research. For the past six years, NCBI Codeathons (formerly NCBI Hackathons) have generated more than 300 computational tools and software packages in its GitHub repositories. As the number of repositories increases, it has become more challenging to find, access, use and reuse these very useful tools.  

In this project, we developed **A**utomated **C**ontainerization **T**ool (ACT) to automatically create a Dockerfile or a Docker image for R- and Python-based repositories using an open-source tool [Dockta](https://github.com/stencila/dockta), which also leverages standard vocabularies to enable greater discoverability of these tools. Containerization is the process to package software code along with all the dependencies needed to run that code allowing that application to be deployed reproducibly on any platform.  By encapsulating the entire analytical environment using containers, ACT can be implemented for any individual or organizational GitHub repositories to further improve the findability, accessibility, itneroperability, and reusability of these tools.


![Logo](assets/ACT.png)

## What is ACT?
ACT or **A**utomated **C**ontainerization **T**ool is a Python package that leverages the container image builder [Dockta](https://github.com/stencila/dockta) to automate the containerization of R- and Python-based GitHub repositories.

## The ACT Workflow

![Schematic](assets/ACT_Workflow.png)

## Installation and Setup
### Docker image
**ACT** has a pre-built Docker image on [Docker Hub](https://hub.docker.com/repository/docker/nciccbr/strides_act). Using the **ACT** Docker image is **_the simplest way_** to run **ACT**—you need only Docker Engine installed on your computer. Please follow the instructions on the Docker website to [install Docker Engine](https://docs.docker.com/engine/install/).

Once Docker Engine is installed, **ACT** can be run as shown in the following example:

```
$ docker run -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/data2 nciccbr/strides_act act build --repo-url https://github.com/CCBR/AAsap.git --img-name ccbr_aasap --output /data2/AAsap
```

### Dockerfile

A local docker image can be built using the provided [Dockerfile](https://raw.githubusercontent.com/STRIDES-Codes/ACT/main/Dockerfile). You will need to [install Docker Engine](https://docs.docker.com/engine/install/) on your computer to build a Docker image.

Once you have a local copy of the Dockerfile and you have Docker Engine installed, you can build the docker image like this:

```
$ docker build -f Dockerfile --no-cache -t strides_act .
```
If all goes well, you should be able to list the Docker image *strides_act* using:
```
$ docker image ls
REPOSITORY    TAG    IMAGE ID    CREATED    SIZE
strides_act    <none>    32f43784742c    22 minutes ago    1.08GB
```

### Local install
If you wish to install a local copy of **ACT**, then you can run [this script](https://raw.githubusercontent.com/STRIDES-Codes/ACT/VK/utils/autocontainer-setup.sh) in our repository. We highly recommend using our Docker image for running **ACT**.

## Usage

### Help menu:
```
$ act --help
Automated Containerization Tool (ACT v1.0.0)
usage: act [-h] [--version] {build,push} ...

ACT: Automated GitHub Containerization Tool

positional arguments:
  {build,push}  List of available sub-commands
    build       Creates Dockerfile and builds Docker image.
    push        Push local Docker image to a Registry

optional arguments:
  -h, --help    show this help message and exit
  --version     show program's version number and exit
```

### Build command (required arguments):
```
./act build --repo-url https://github.com/REPOSITORY/URL.git --img-name docker_image_name_lower_case --output ~/OUTPUT/DIRECTORY
```

You can get detailed help about the arguments using 
```./act build --help
Automated Containerization Tool (ACT v1.0.0)
usage: act build [-h] [--skip-build]
                       [--base-img BASE_IMG]
                       [--use-dockta-reqs]
                       --repo-url REPO_URL
                       --img-name IMG_NAME
                       --output OUTPUT

Creates a Dockerfile for a Github repository and builds the
local Docker image. Please see the push sub command to push
a local image to a Docker Registry. The build sub command
takes a Github URL and a output directory to clone the Github
repository.

required arguments:
  --repo-url REPO_URL       URL of the Github repository to build
                            an Docker image.

  --img-name IMG_NAME       Name of the local docker image to be
                            built. This image name can be provided
                            to the push sub command to push the
                            image to a Docker Registry.

  --output OUTPUT           Path to an output directory. This
                            path is where ACT will clone the
                            Github repository and create the
                            Dockerfile. If the provided output
                            directory does not exist, it will
                            be created automatically.
                            After the build sub command completes,
                            a Dockerfile will be created in the
                            user provided output directory and a
                            local Docker image will be built.

optional arguments:
  -h, --help           show this help message and exit
  --skip-build         Only create a Dockerfile, skips docker build.
  --base-img BASE_IMG  Base image to use in the Dockerfile,
                       default=ubuntu:18.04.
  --use-dockta-reqs    Use dockta generated ".requirements.txt" file.

example:
  # Step 1.) Create Dockerfile and build the docker image.
  act build --repo-url https://github.com/CCBR/AAsap \
             --img-name ccbr_aasap \
             --output /home/$USER/scratch/

version:
  v1.0.0
```

### Push command (required arguments):
```
$ ./act push --img-name docker_image_name_lower_case --registry DockerHub_UserName_OR_OrganizationName
```

You can get detailed help about the arguments using
```
$ ./act push --help
Automated Containerization Tool (ACT v1.0.0)
usage: act push [-h] [--tag TAG]
                      --img-name IMG_NAME
                      --registry REGISTRY

Pushes a local docker image to a Docker registry. Please
see the build sub command to for information on how to build
a local Docker image. The push sub command takes the name of
a local image, a Docker registry prefix, and a optional tag
to tag and push an image to a registry like Dockerhub.

required arguments:
  --img-name IMG_NAME   Name of the local docker image to be
                        pushed to a Docker registry. This image
                        name was defined via the '--img-name'
                        option of the build sub command.
                        Please see the build sub command
                        for more information.

  --registry REGISTRY   Docker registry prefix. If pushing
                        an image to a user account on DockerHub,
                        this will be the user's DockerHub username.
                        If push to a org account, this will be the
                        name of the Dockerhub organization.

optional arguments:
  -h, --help  show this help message and exit
  --tag TAG   Tag for Docker image, defaults to latest.

example:
  # Step 1.) Push local docker image to DockerHub.
  act push  --img-name ccbr_aasap \
             --registry nciccbr \
             --tag v1.0.0

version:
  v1.0.0
```

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
