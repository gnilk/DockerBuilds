# DockerBuilds

Docker files for various versions of GCC to simplify building projects with various versions of GCC
* GCC 11.4
* GCC 12.3
* GCC 13.3
* GCC 14.1

All images also installs `testrunner` from `https://github.com/gnilk/testrunner` as I use it for unit-testing.
Plus a few other things (like `doxygen` and `binutils`)



# Building Images

First time building:
```shell
./build.sh
```

Rebuild (this will skip the cache and you will get the latest version of all dependencies):
```shell
./rebuild.sh
```

The build will map your current used (when running the build) to the docker user UID/GID when active.
This makes it work decently against your build directory - assuming you have the same dev-user.

# Running Images

It is expected that images are interactive, basically from the project source directory:
```shell
docker run -it --entrypoint /bin/bash -v `pwd`:/proj build_gcc_11.4
```
This will spin up a bash-shell where you can build as normal. Make sure you clean out the build directory 
when changing containers and/or versions. Otherwise you will have strange errors.

Note: You are working against your host tree - and all changes will affect your local/host files!


