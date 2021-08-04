ExternalProject_Add(zlib
    URL ${zlib_url}
    URL_MD5 ${zlib_md5}
    DOWNLOAD_NAME ${zlib_dlname}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
)
