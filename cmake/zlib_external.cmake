# ZLIB

# Fix Windows missing "zlib.dll":
if(WIN32 AND (${CMAKE_PROJECT_NAME} STREQUAL ${PROJECT_NAME}))
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_PATH}/$<CONFIG> CACHE INTERNAL "" FORCE)
endif()

set(ZLIB_COMPAT ON CACHE INTERNAL "" FORCE)
set(ZLIB_ENABLE_TESTS OFF CACHE INTERNAL "" FORCE)

FetchContent_Declare(zlib
                    GIT_REPOSITORY https://github.com/madler/zlib.git
                    GIT_TAG v1.3
                    USES_TERMINAL_DOWNLOAD TRUE)
FetchContent_MakeAvailable(zlib)

# Fix Windows zlib dll names from "zlibd1.dll" to "zlib.dll":
if(WIN32 AND BUILD_SHARED_LIBS)
    set_target_properties(zlib PROPERTIES OUTPUT_NAME "zlib")
    set_target_properties(zlib PROPERTIES DEBUG_POSTFIX "")
    set_target_properties(zlib PROPERTIES SUFFIX ".dll")
endif()
