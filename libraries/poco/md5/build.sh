#!/bin/bash

set -e
set -x

rm -rf build
mkdir build
pushd build

conan install ..
if [ "$USE_CMAKE" == "yes" ]; then
	cmake .. -DCMAKE_BUILD_TYPE=Release
	cmake --build .
	bin/md5
else
	popd
	premake5 --to=build gmake2
	pushd build
	make -j
	bin/Release/md5
fi
