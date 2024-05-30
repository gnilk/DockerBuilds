#!/bin/sh

docker run -it --entrypoint /bin/bash -v `pwd`:/proj build_gcc_11.4