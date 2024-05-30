#!/bin/sh

#
# rebuild all - discard anything in the cache - use this if you want to enforce dependency updates (packages or trun)
#

# gcc
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc_8.4 -f dockerfiles/Dockerfile_GCC_8.4 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc_11.4 -f dockerfiles/Dockerfile_GCC_11_4 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc_12.3 -f dockerfiles/Dockerfile_GCC_12_3 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc_13.3 -f dockerfiles/Dockerfile_GCC_13_3 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc_14.1 -f dockerfiles/Dockerfile_GCC_14_1 .

# clang 
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.19 -f dockerfiles/Dockerfile_CLang_19 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.18 -f dockerfiles/Dockerfile_CLang_18 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.16 -f dockerfiles/Dockerfile_CLang_16 .
docker build --no-cache --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.14 -f dockerfiles/Dockerfile_CLang_14 .

