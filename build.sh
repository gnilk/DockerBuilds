#!/bin/sh

# gcc - 8.4.0 built from sources - with new CMAKE (this builds on top oc GCC 13.3)
#
# Disabled, since it takes forever
# docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc.8.4.0 -f dockerfiles/Dockerfile_GCC_8_4 .                                     

# gcc
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc.11.4 -f dockerfiles/Dockerfile_GCC_11_4 .
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc.12.3 -f dockerfiles/Dockerfile_GCC_12_3 .
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc.13.3 -f dockerfiles/Dockerfile_GCC_13_3 .
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_gcc.14.1 -f dockerfiles/Dockerfile_GCC_14_1 .

# clang 
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.19 -f dockerfiles/Dockerfile_CLang_19 .
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.18 -f dockerfiles/Dockerfile_CLang_18 .
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.16 -f dockerfiles/Dockerfile_CLang_16 .
docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` -t build_clang.14 -f dockerfiles/Dockerfile_CLang_14 .

