Reproducible Analysis with Docker
===============================
[Docker](http://www.docker.com) is a containerization system that can solve many different problems for many different
domains of IT. For researchers and data scientists, Docker makes possible the creation of a containerized analysis
process appliance that can be run by any researcher on any server hosting the Docker runtime.  Using the triangle of
network accessible data, source code, and Docker images, researchers can now produce a completely reproducible
runtime that processes their specific data to produce their specific results and figures.

####Documentation
The Docker website has [excellent references](https://docs.docker.com/reference).

####Installation
+ The [references](https://docs.docker.com/reference/#installation) explain everything
+ Mac Users will find [these tips](http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide) extremely helpful.

####Docker Build Contexts and the Dockerfile
Explained well in the [references](https://docs.docker.com/reference/builder/).
The Docker build context is a directory with a Dockerfile, and any other files that you want
to make available in the image to be used, and distributed.
+ Here are some handy [Dos and Donts](http://devo.ps/blog/docker-dos-and-donts/).
+ Everything inside the directory with the Dockerfile can be ADDed to the image being built
+ When the docker host is not on your host machine (note, on the Mac, the docker host is the
boot2docker VM running via Virtualbox) the entire directory is rsync'ed from your machine to the
host machine, unless you specify files to skip in a .dockerignore file in the directory.

####Docker Applications
+ Image that wraps the logic for exposing a single process interface to the user
+ Can be run on a docker host as if it were a natively installed application.  For commandline
applications, this includes the ability to connect the host STDIN, STDOUT, and STDERR and
tty to the container for interactive use, and allows commandline arguments to be passed
from the host commandline in the same way they would be passed if running as a natively
installed application

####Docker Volume Containers
+ Image that exposes a defined set of directories to other containers
+ Run with a name to produce a container
+ The container will typically exit immediatly (these do not need to stay running), but the container's directories are cached by the docker host until the container is removed from the host
+ A named volume container is connected to an application container by passing the volume container name to the application container
when it is run using the --volumes-from docker run flag.  Volume container directories are mounted read-write by default, but this can be
overridden by appending flags to the --volumes-from name:ro (see [references](https://docs.docker.com/reference/run/#volume-shared-filesystems) for details).
+ An application container can read from or write to these directories as needed
+ Files from a volume container can be extracted either using the [docker cp](https://docs.docker.com/reference/commandline/cli/#cp) command on the volume container
itself, or running another application image (possibly with /bin/bash) with the --volumes-from $name so that the files can be selectively copied and/or processed into the
local host path.

####Docker Hubs
+ These are network accessible registries of named Docker images that can be used by any user with access to the hub
+ The docker commandline application has the Worldwide [Docker Hub](https://hub.docker.com) configured by default
+ You can configure the commandline to know about other hubs, such as the [Duke Docker Registry](http://sites.duke.edu/docker/dukes-docker-image-repository/)
+ When you run an image, the docker commandline will first look for it on the host. If it does not find it, it will attempt to pull it from its configured hub

####Extending Images
Any image available to you from the docker host or docker hubs configured into your docker command can be extended to create a new image with new functionality.

+ create a build context directory for the new image
+ create a Dockerfile, starting FROM the name of the image, or from a name of your own choosing
+ optionally tag the image (you may have to pull it if it is not already on your host) with the name your build starts FROM
+ build the image.  The image can then be pushed up to a docker hub for use by anyone with access to the hub

####Security and other Good Practices
+ Unlike in traditional VM, a docker container can access some host resources
+ DO NOT RUN AS ROOT BY DEFAULT!
   +  USER + ENTRYPOINT + CMD + WORKDIR
   + These can be overridden at run time
   + These can be overridden in new containers starting FROM them to ‘extend’ them
   + Be very specific with commands, rely on wildcards and shell/exec commands sparingly
+ Use the same paranoid practices in your container apps that you use in web/cgi applications:
   + use open([“cmd”,”arg1”,”arg2”]) instead of open(“cmd arg1 arg2”)
   + check for tainted input
   + watch for wildcards in filenames, especially if doing chmod, chown, chgrp, rsync, etc. ( http://www.defensecode.com/public/DefenseCode_Unix_WildCards_Gone_Wild.txt )
[More](http://opensource.com/business/14/9/security-for-docker)

####Exercises
Work in groups of 3-4:
+ install Docker on your system
+ run the following (for non mac users, use sudo to run docker):
```bash
$ docker run -ti --rm centos6 echo "HELLO WORLD"
```
+ Run the Reproducible Plasmodium alignment using instructions on the github repository:
[Reproducible Docker Analysis Github](https://github.com/dmlond/docker_bwa_aligner)

* Depending our network bandwidth, we may need to stagger our runs so, as it does download a fair bit of data

The plasmodium alignment docker images are available on the Official Docker Hub:
+ [Reproducible Docker Analysis DockerHub Images](https://registry.hub.docker.com/u/dmlond)
