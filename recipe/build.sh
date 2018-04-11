#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

# make builds with gcc>=5 compatible with conda-forge, currently using gcc<5
CXXFLAGS="${CXXFLAGS} -D_GLIBCXX_USE_CXX11_ABI=0"

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
make test
make install
