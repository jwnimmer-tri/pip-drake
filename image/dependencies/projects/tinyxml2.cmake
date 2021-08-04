ExternalProject_Add(tinyxml2
  URL ${tinyxml2_url}
  URL_MD5 ${tinyxml2_md5}
  DOWNLOAD_NAME ${tinyxml2_dlname}
  ${COMMON_EP_ARGS}
  ${COMMON_CMAKE_EP_ARGS}
  CMAKE_ARGS
    ${COMMON_CMAKE_ARGS}
)
