project(mris_transform)

include_directories(${FS_INCLUDE_DIRS})

add_executable(mris_transform mris_transform.c)
add_help(mris_transform mris_transform.help.xml)
target_link_libraries(mris_transform utils)

add_test_script(NAME mris_transform_test SCRIPT test.py DEPENDS mris_transform)

install(TARGETS mris_transform DESTINATION bin)
