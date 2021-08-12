## Introduction
Improving the findability, accessibility, interoperability and reusability is a key component in moving towards greater reproducibility in computational biomedical research. For the past six years, NCBI Codeathons (formerly NCBI Hackathons) have generated more than 300 computational tools and software packages in its GitHub repositories. As the number of repositories increases, it has become more challenging to find, access, use and reuse these very useful tools.  

In this project, we developed **A**utomated **C**ontainerization **T**ool (ACT) to automatically create a Dockerfile or a Docker image for R- and Python-based repositories using an open-source tool [Dockta](https://github.com/stencila/dockta), which also leverages standard vocabularies to enable greater discoverability of these tools. Containerization is the process to package software code along with all the dependencies needed to run that code allowing that application to be deployed reproducibly on any platform.  By encapsulating the entire analytical environment using containers, ACT can be implemented for any individual or organizational GitHub repositories to further improve the findability, accessibility, itneroperability, and reusability of these tools.


![Logo](assets/ACT.png)

## What is ACT?
ACT or **A**utomated **C**ontainerization **T**ool is a Python package that leverages the container image builder [Dockta](https://github.com/stencila/dockta) to automate the containerization of R- and Python-based GitHub repositories.

## The ACT Workflow

![Schematic](assets/ACT_Workflow.png)

## Installation and Setup

There are three ways to install and run ACT.  ACT has a pre-built Docker image on Docker Hub. Using the ACT Docker image is the simplest way to run ACT—you need only Docker Engine installed on your computer. 

### 1. Using the Docker Image directly 
#### Please follow the instructions on the Docker website to install Docker Engine.
####Once Docker Engine is installed, ACT can be run as follows:

```
$ docker run -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/data2 nciccbr/strides_act:v1.1.0 agct build --repo-url https://github.com/CCBR/AAsap.git --img-name ccbr_aasap --output /data2/AAsap
```


### 2. Build a Docker image locally using the Dockerfile provided in this repository. A local docker image can be built using the provided Dockerfile. You will need to install Docker Engine on your computer to build a Docker image.   

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


### 3. As an alternative, if you wish to install a local copy of ACT, then you can run this script in our repository. We highly recommend using our Docker image, as described above, for running ACT.
#### Dependencies for local installation

##### Install Node.js:
```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```

##### Install Dockta via the Node package manager (npm): 
```sudo npm install --global @stencila/dockta```

##### Install Python 3 (Python 3.5 or greater):
```sudo apt install python3.8```

##### Obtain ACT:
```git clone https://github.com/STRIDES-Codes/ACT.git```


## Usage

### Help menu:
```./agct -h```

### Build command (required arguments):
```./agct build --repo-url https://github.com/REPOSITORY/URL.git --img-name docker_image_name_lower_case --output ~/OUTPUT/DIRECTORY```

More options and help? ```./agct build -h```

### Push command (required arguments):
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
