#!/bin/bash
set -euo pipefail

export TOOLCHAIN=~/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2021-06-12-a.xctoolchain
export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk
export LLVM=/usr/local/Cellar/llvm/11.1.0
export ENZYME=/usr/local/Cellar/enzyme/0.0.9/lib/LLVMEnzyme-11.dylib

export PATH=${TOOLCHAIN}/usr/bin:${LLVM}/bin:${PATH}
export DYLD_LIBRARY_PATH=${TOOLCHAIN}/usr/lib/swift/macosx

echo "Building swift version..."
( cd swift; make )

echo "Building enzyme version..."
( cd enzyme; make )

echo "Running swift version..."
time ./swift/Awesome

echo "Running enzyme version..."
time ./enzyme/Awesome
