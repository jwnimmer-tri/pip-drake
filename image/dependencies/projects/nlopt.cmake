ExternalProject_Add(nlopt
    URL ${nlopt_url}
    URL_MD5 ${nlopt_md5}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
    )
