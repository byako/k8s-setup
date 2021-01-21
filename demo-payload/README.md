This is a 'Hello world!' demo app, packageable into container image that you
can use as a payload to deploy to k8s.

To compile and package the binary, run:
```shell
make package
```


## Demo payload application

Is a C hello-world application, it exits after printing message. You need any
C compiler to make binary out of it. Makefile uses GCC, make sure you have GCC
installed if using Makefile to build and package it.


## Container image

Is buildable after you compile the C file into binary executable. Use your
favourite container image builder, be that buildah or docker or any other.

Makefile uses docker client tool to build Dockerfile into container image, so
make sure Docker (either CE or EE, typically called docker.io in mainstream
distros) is installed on your system if using Makefile.
