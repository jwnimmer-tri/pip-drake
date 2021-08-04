ExternalProject_Add(eigen
    URL ${eigen_url}
    URL_MD5 ${eigen_md5}
    DOWNLOAD_NAME ${eigen_dlname}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
)
