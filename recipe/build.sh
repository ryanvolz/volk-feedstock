#!/bin/bash

mkdir build
cd build
cmake \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DPYTHON_EXECUTABLE=$PYTHON \
    -DLIB_SUFFIX="" \
    -DENABLE_PROFILING=OFF \
    -DENABLE_TESTING=ON \
    ..
make -j${CPU_COUNT}
ctest --output-on-failure || true
make install
