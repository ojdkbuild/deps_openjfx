
cmake_minimum_required ( VERSION 2.8.12 )

# project
project ( openjfx NONE )

# options
set ( ${PROJECT_NAME}_UPDATE "152" CACHE STRING "Version string 'update' field" )
set ( ${PROJECT_NAME}_BUILD "04" CACHE STRING "Version string 'build' field" )
set ( ${PROJECT_NAME}_RPMBUILD "0" CACHE STRING "Build number in image name" )
set ( ${PROJECT_NAME}_OJFX_COMPILE_MEDIA "true" CACHE STRING "Enable 'media' module for OpenJFX" )

# image naming
set ( ${PROJECT_NAME}_BASE openjfx-${openjdk_MAJOR_VERSION}.0.${${PROJECT_NAME}_UPDATE}-${${PROJECT_NAME}_RPMBUILD}.b${${PROJECT_NAME}_BUILD}.${openjdk_MILESTONE}.windows )
set ( ${PROJECT_NAME}_IMAGE ${${PROJECT_NAME}_BASE}.${openjdk_ARCH} )

# build config
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/gradle.properties
        ${OJDKBUILD_DIR}/lookaside/openjfx )
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/build.properties
        ${OJDKBUILD_DIR}/lookaside/openjfx )        
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/run-gradle.bat
        ${OJDKBUILD_DIR}/lookaside/openjfx )

add_custom_target ( ${PROJECT_NAME}
        COMMAND cmd /c run-gradle.bat
        WORKING_DIRECTORY ${OJDKBUILD_DIR}/lookaside/openjfx
        COMMENT "Building OpenJFX ..." )
        
add_custom_target ( ${PROJECT_NAME}_image        
        COMMAND ${CMAKE_COMMAND} -E make_directory ${${PROJECT_NAME}_IMAGE}
        COMMAND (robocopy ${OJDKBUILD_DIR}/lookaside/openjfx/build/bundles ${${PROJECT_NAME}_IMAGE} javafx-sdk-overlay.zip /mov ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        COMMAND pushd ${${PROJECT_NAME}_IMAGE} && ${openjdk_TOOLS}/zip/unzip.exe -q javafx-sdk-overlay.zip && popd
        COMMAND ${CMAKE_COMMAND} -E remove ${${PROJECT_NAME}_IMAGE}/javafx-sdk-overlay.zip
        COMMAND ${CMAKE_COMMAND} -E remove ${${PROJECT_NAME}_IMAGE}/jre/bin/msvcr100.dll
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Creating OpenJFX image ..." )
add_dependencies ( ${PROJECT_NAME}_image ${PROJECT_NAME} )         

add_custom_target ( ${PROJECT_NAME}_zip
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMAND ${openjdk_TOOLS}/zip/zip.exe -qr${openjdk_COMPRESS_LEVEL} ${${PROJECT_NAME}_IMAGE}.zip ${${PROJECT_NAME}_IMAGE}
        COMMAND (robocopy ${CMAKE_CURRENT_BINARY_DIR} ${openjdk_DEST_DIR} ${${PROJECT_NAME}_IMAGE}.zip /mov ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        COMMENT "Creating OpenJFX ZIP bundle ..." )
add_dependencies ( ${PROJECT_NAME}_zip ${PROJECT_NAME}_image )        
        