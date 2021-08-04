ExternalProject_Add(double-conversion
    URL ${double-conversion_url}
    URL_MD5 ${double-conversion_md5}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
    )
