CMAKE_MINIMUM_REQUIRED(VERSION 2.4.3 FATAL_ERROR)

add_subdirectory(tree)
add_subdirectory(InitReader)
add_subdirectory(RecipeReader)
add_subdirectory(plugins)
add_subdirectory(Plugin)
add_subdirectory(Chef)
add_subdirectory(cooker)
add_subdirectory(visualcooker)

add_subdirectory(SlowCtrl)

add_subdirectory(combine)



set (BUILD_WITHDB off CACHE bool "Enable DB link for database
(normally off)")

#Things we might need later

#add_subdirectory(Reconstruction)
#add_subdirectory(Survey)
add_subdirectory(gdml)
#add_subdirectory(udpLog)

#set (BUILD_ALACARTE on CACHE bool "Enable build of alacarte")
#IF(BUILD_ALACARTE)
#  add_subdirectory(alacarte)
#ENDIF ()
