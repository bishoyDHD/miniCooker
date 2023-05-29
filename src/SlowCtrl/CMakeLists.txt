# Check if cmake has the required version
CMAKE_MINIMUM_REQUIRED(VERSION 3.0 FATAL_ERROR)
# Needed for cmake 2.6
IF(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
ENDIF(COMMAND cmake_policy)

# Set project name
PROJECT(SlowCtrlManager)

SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")

SET(INCLUDES  ${ROOT_INCLUDE_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/include" "${CMAKE_SOURCE_DIR}/include")

INCLUDE_DIRECTORIES(${INCLUDES})
# Set output path for libraries and executables within build directory (makes linking easier...)
SET(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")
SET(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

SET(LINKDEF ${CMAKE_CURRENT_SOURCE_DIR}/src/include/LinkDef.hh)
SET(DICTIONARY ${CMAKE_CURRENT_BINARY_DIR}/SlowCtrlManagerDict.cpp)
ROOT_GENERATE_DICTIONARY(${CMAKE_SOURCE_DIR}/include/slowctrl.h "${LINKDEF}" "${DICTIONARY}" "${INCLUDES}")


add_library(SlowCtrlManager SHARED src/slowctrl.cpp ${DICTIONARY} )
TARGET_LINK_LIBRARIES(SlowCtrlManager "-L${ROOT_LIBRARY_DIR}" ${ROOT_LIBRARIES})
INSTALL(TARGETS SlowCtrlManager RUNTIME DESTINATION ${BINDIR} LIBRARY DESTINATION ${LIBDIR} ARCHIVE DESTINATION ${LIBDIR})
