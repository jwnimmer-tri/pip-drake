ExternalProject_Add(patchelf
    URL ${patchelf_url}
    URL_MD5 ${patchelf_md5}
    ${COMMON_EP_ARGS}
    BUILD_IN_SOURCE 1
    PATCH_COMMAND ./bootstrap.sh
    CONFIGURE_COMMAND ./configure
        --prefix=${CMAKE_INSTALL_PREFIX}
        --disable-shared
        CFLAGS=-fPIC
        CXXFLAGS=-fPIC
    BUILD_COMMAND make
    INSTALL_COMMAND make install
    )
