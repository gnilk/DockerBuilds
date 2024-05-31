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

## Building the GCC 8.4.0 image
The GCC 8.4.0 is using the GCC 13.3 base image and downlads and builds GCC from sources. Thus it takes quite a while.

Therefore the build is disabled in the shell script. Suggested that you run this stand alone - over night - as it takes forever - unless you have a power horse. On my machine (which builds pucko in 6.5 seconds) building the GCC image takes roughly 10 minutes.


# Running Images

It is expected that images are interactive, basically from the project source directory:
```shell
docker run -it --entrypoint /bin/bash -v `pwd`:/proj build_gcc_11.4
```
This will spin up a bash-shell where you can build as normal. Make sure you clean out the build directory 
when changing containers and/or versions. Otherwise you will have strange errors.

Note: You are working against your host tree - and all changes will affect your local/host files!

# Adding stuff and updating the images
If you want to add stuff and persist changes between runs you need to run `docker commit` in between.
For instance, adding a third party libraray. Do this:
* Start the container
* Add the libraries you want
* commit the changes (use a new tag is perhaps a wise idea)
* exit the container

use `docker ps` to check the container id.
```shell
$ docker ps
CONTAINER ID   IMAGE                   COMMAND       CREATED         STATUS         PORTS     NAMES
92b8342b2975   build_gcc.8.4.0:stuff   "/bin/bash"   6 seconds ago   Up 5 seconds             thirsty_euclid
```

Commit the changes:
```shell
$ docker commit 92b8342b2975 build_gcc.8.4.0:stuff
```

If you have environment variables you need to do this:
```shell
$ docker commit --change "ENV MY_VAR=the_value_of_my_var" 92b8342b2975 build_gcc.8.4.0:stuff
```

Note: If you need to specify multiple variables. You need to exit and restart the container between each change.
I believe this is because you get a new container ID with the changes and it doesn't update the running.
So basically:
* start the container
* use `docker ps` to get the ID
* use `docker commit --change...` to set the variable
* from the container, exit it
* repeat until all set..

Once everything is configured you can restart the container using the tag:
```shell
docker run -it --entrypoint /bin/bash -v `pwd`:/proj build_gcc.8.4.0:stuff
```