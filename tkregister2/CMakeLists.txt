project(tkregister2)

include_directories(${FS_INCLUDE_DIRS})

# first build without Tcl/Tk and OpenGL (command-line processing only)
add_executable(tkregister2_cmdl tkregister2.c)
target_compile_definitions(tkregister2_cmdl PRIVATE -DNO_GUI)
target_link_libraries(tkregister2_cmdl utils)
install(TARGETS tkregister2_cmdl DESTINATION bin)

if(NOT MINIMAL AND BUILD_GUIS AND OPENGL_FOUND AND TCLTKTIXBLT_FOUND)

  if(APPLE AND NOT BUILD_OSX_TK_GUIS)
    install_symlinks(${CMAKE_SOURCE_DIR}/distribution/osx32b/tkregister2 TYPE programs DESTINATION bin)
  else()

    include_directories(
      ${CMAKE_SOURCE_DIR}/unix
      ${TCLTKTIXBLT_INCLUDE_DIR}
      ${GLUT_INCLUDE_DIR}/GL
      ${X11_INCLUDE_DIR}
    )

    add_executable(tkregister2 tkregister2.c)
    target_link_libraries(tkregister2
      utils
      ${OPENGL_LIBRARIES}
      ${GLUT_LIBRARIES}
      ${X11_LIBRARIES}
      ${TCLTKTIXBLT_LIBRARIES}
    )

    install(TARGETS tkregister2 DESTINATION bin)

  endif()

endif()
