cd boost_1_58_0

./bootstrap.sh --with-toolset=clang --prefix=/usr/local

./b2 clean

./b2 link=shared,static runtime-link=shared threading=multi,single variant=release debug-symbols=on \
    --build-dir=/tmp/boostbuild toolset=clang cxxflags="-std=c++1y" \
    -a -q -j2 --layout=versioned stage


./b2 link=shared,static runtime-link=shared threading=multi,single variant=release debug-symbols=on \
    --build-dir=/tmp/boostbuild toolset=clang cxxflags="-std=c++1y" \
    -q -j2 --layout=versioned install 


#./b2 toolset=clang cxxflags="-std=c++1y" --prefix=/usr/local --buildir=/tmp/boostbuild


#./b2 toolset=clang cxxflags="-std=c++11 -stdlib=libc++" \
#    linkflags="-stdlib=libc++" --prefix=/usr/local \
#    -j 2 define=BOOST_SYSTEM_NO_DEPRECATED stage release 

#./b2 install toolset=clang cxxflags="-std=c++11 -stdlib=libc++" \
#    linkflags="-stdlib=libc++" --prefix=/usr/local
