# Check if cmake has the required version
CMAKE_MINIMUM_REQUIRED(VERSION 3.0 FATAL_ERROR)
# Needed for cmake 2.6
IF(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
ENDIF(COMMAND cmake_policy)

# Set project name
PROJECT(Chef)



SET(INCLUDES ${ROOT_INCLUDE_DIR} ${Boost_INCLUDE_DIRS}
${XERCES_INCLUDE_DIR}
${XQILLA_INCLUDE_DIR}
"${CMAKE_CURRENT_SOURCE_DIR}/include" "${CMAKE_SOURCE_DIR}/include" ${GSL_INCLUDE_DIR})
INCLUDE_DIRECTORIES(${INCLUDES})

add_library(Chef src/chef.cpp )

TARGET_LINK_LIBRARIES(Chef InitReader RecipeReader Plugin cookerrawtree "-L${ROOT_LIBRARY_DIR}"  dl ${ROOT_LIBRARIES} ${Boost_LIBRARIES})

set_target_properties ( Chef PROPERTIES COMPILE_DEFINITIONS
"ARCHDIR=\"${ARCHDIR}\"; LIBSUFFIX=\"${CMAKE_SHARED_LIBRARY_SUFFIX}\" ")
