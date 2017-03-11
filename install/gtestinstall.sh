#!/bin/bash

fetchAndBuildGoogleTest()
{

    echo "======================"
    echo "mkdir googletest_tmp"
    echo "======================"
    mkdir ./googletest_tmp/ && cd ./googletest_tmp || exit -1

    echo "======================"
    echo "git clone googletest"
    echo "======================"
    git clone github:google/googletest
    cd googletest || exit -1

    echo "======================"
    echo "build and test googletest"
    echo "======================"
    mkdir build && cd build || exit -1
    cmake -Dgtest_build_samples=ON -Dgtest_build_tests=ON ../
    make
    make test
}

macInstall()
{
    echo "======================"
    echo "install googletest libs"
    echo "======================"
    cp -r ../include/gtest /usr/local/include
    cp lib*a /usr/local/lib/
}

fetchAndBuildGoogleTest
macInstall
