# find the LZMA++ constrained fitter wrapper
# simplistic, should mark variables as cached or advanced

message(STATUS "Looking for LZMA...")


set(LZMA_SEARCH_PATHS
  "/usr/include"
  "/usr/local/opt/xz/include"
  "/usr/local/include"
  "/opt/homebrew/include"
)

find_path(LZMA_BASE_DIR lzma.h
  PATHS  ${LZMA_SEARCH_PATHS}  
  NO_DEFAULT_PATH
  )

set(LZMA_INCLUDE_DIR ${LZMA_BASE_DIR})

message(STATUS "Dirs: ${LZMA_INCLUDE_DIR}")

if(NOT LZMA_INCLUDE_DIR)
  Message(STATUS "Looking for LZMA... - LZMA.h not found")
  if(LZMA_FIND_REQUIRED)
    message(FATAL_ERROR "LZMA is required, please make sure cmake finds it")
  endif()
  return()
endif()

include_directories(${LZMA_INCLUDE_DIR})

FIND_LIBRARY(LZMA_LIBRARIES NAMES LZMA
  PATHS ${LZMA_SEARCH_PATHS}
  PATH_SUFFIXES "lib"
  NO_DEFAULT_PATH
  )

SET(LZMA_LIBRARY_DIR "${LZMA_BASE_DIR}/lib")

set(LZMA_FOUND TRUE)
Message(STATUS "Looking for LZMA... - Found ${LZMA_LIBRARIES}")

