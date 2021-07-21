ExternalProject_Add(suitesparse
    DEPENDS lapack
    URL ${suitesparse_url}
    URL_MD5 ${suitesparse_md5}
    ${COMMON_EP_ARGS}
    BUILD_IN_SOURCE 1
    PATCH_COMMAND ${CMAKE_COMMAND}
        -Dsuitesparse_patch=${CMAKE_SOURCE_DIR}/patches/suitesparse
        -Dsuitesparse_source=${CMAKE_BINARY_DIR}/src/suitesparse
        -DINSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
        -P ${CMAKE_SOURCE_DIR}/patches/suitesparse/patch.cmake
    CONFIGURE_COMMAND ""
    BUILD_COMMAND make
    INSTALL_COMMAND make install
    )
