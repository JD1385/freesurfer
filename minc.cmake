IF (WIN32)
  FIND_PATH(minc_ROOT_DIR 
    NAMES lib/volume_io2.lib
    PATHS
      $ENV{MINC_ROOT_DIR}
    C:/
      D:/
      $ENV{ProgramFiles}
    $ENV{ProgramFiles}/gnuwin32/
    $ENV{ProgramFiles}/mni/
    PATH_SUFFIXES 
      mni
    minc
    DOC "MNI include directory?"
    )
ENDIF (WIN32) 

FIND_PATH(MINC_INCLUDE_DIR 
  NAMES minc.h
  PATHS
    ${minc_ROOT_DIR}/include
    $ENV{INCLUDE_DIR}
)
MARK_AS_ADVANCED(MINC_INCLUDE_DIR)
# Look for the library.
FIND_LIBRARY(MINC_LIBRARY 
  NAMES volume_io2 volume_io libvolume_io libvolume_io2
  PATHS
    ${minc_ROOT_DIR}/lib
    $ENV{LIBRARY_PATH}
)
MARK_AS_ADVANCED(MINC_LIBRARY)

# Copy the results to the output variables.
IF(MINC_INCLUDE_DIR AND MINC_LIBRARY)
  SET(MINC_FOUND 1)
  SET(MINC_LIBRARIES ${MINC_LIBRARY})
  SET(MINC_INCLUDE_DIRS ${MINC_INCLUDE_DIR})
ELSE(MINC_INCLUDE_DIR AND MINC_LIBRARY)
  SET(MINC_FOUND 0)
  SET(MINC_LIBRARIES)
  SET(MINC_INCLUDE_DIRS)
ENDIF(MINC_INCLUDE_DIR AND MINC_LIBRARY)

# Report the results.
IF(NOT MINC_FOUND)
  SET(MINC_DIR_MESSAGE
    "MINC was not found. Make sure MINC_LIBRARY and MINC_INCLUDE_DIR are set.")
  IF(NOT MINC_FIND_QUIETLY)
    MESSAGE(STATUS "${MINC_DIR_MESSAGE}")
  ELSE(NOT MINC_FIND_QUIETLY)
    IF(MINC_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "${MINC_DIR_MESSAGE}")
    ENDIF(MINC_FIND_REQUIRED)
  ENDIF(NOT MINC_FIND_QUIETLY)
ENDIF(NOT MINC_FOUND)