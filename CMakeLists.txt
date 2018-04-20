# Copyright 2017, akashche at redhat.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required ( VERSION 2.8.12 )

# project
project ( openjfx NONE )

# options
set ( ${PROJECT_NAME}_BUILD "11" CACHE STRING "Version string 'build' field" )
set ( ${PROJECT_NAME}_OJFX_COMPILE_MEDIA "true" CACHE STRING "Enable 'media' module for OpenJFX" )
set ( ${PROJECT_NAME}_OJFX_COMPILE_WEBKIT "true" CACHE STRING "Enable 'web' module for OpenJFX" )
set ( ${PROJECT_NAME}_OJFX_JAVA_HOME ${CMAKE_CURRENT_BINARY_DIR}/../${openjdk_IMAGE} CACHE STRING "Path to jdk to use for building OpenJFX" )

set ( ${PROJECT_NAME}_INSTALLER_FEATURE_LEVEL "2" CACHE STRING "MSI Feature 'Level' for 'openjfx' component" )
set ( ${PROJECT_NAME}_INSTALLER_FEATURE_TITLE "OpenJFX Runtime" CACHE STRING "MSI Feature title for 'openjfx' component" )
set ( ${PROJECT_NAME}_INSTALLER_FEATURE_DESCRIPTION "OpenJFX and WebKit runtime files." CACHE STRING "MSI Feature description for 'openjfx' component" )

# image naming
set ( ${PROJECT_NAME}_BASE openjfx-${openjdk_MAJOR_VERSION}.0.${openjdk_UPDATE}-${openjdk_RPMBUILD}.b${${PROJECT_NAME}_BUILD}.${openjdk_MILESTONE}.windows )
set ( ${PROJECT_NAME}_IMAGE ${${PROJECT_NAME}_BASE}.${openjdk_ARCH} )

# redist path
if ( openjdk_32_BIT )
    set ( ${PROJECT_NAME}_TOOLCHAIN_ARCH "x86" CACHE INTERNAL "" )
    set ( ${PROJECT_NAME}_REDIST_ARCH "x86" CACHE INTERNAL "" )
else ( )
    set ( ${PROJECT_NAME}_TOOLCHAIN_ARCH "x86_64" CACHE INTERNAL "" )
    set ( ${PROJECT_NAME}_REDIST_ARCH "x64" CACHE INTERNAL "" )
endif ( )

# build config
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/gradle.properties
        ${OJDKBUILD_DIR}/upstream/openjfx-8u )
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/build.properties
        ${OJDKBUILD_DIR}/upstream/openjfx-8u )
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/run-gradle.bat
        ${OJDKBUILD_DIR}/upstream/openjfx-8u )

# targets
add_custom_command ( OUTPUT ${OJDKBUILD_DIR}/upstream/openjfx-8u/build/bundles/javafx-sdk-overlay.zip
        COMMAND cmd /c run-gradle.bat
        WORKING_DIRECTORY ${OJDKBUILD_DIR}/upstream/openjfx-8u
        DEPENDS image
        COMMENT "Building OpenJFX ..." )

add_custom_target ( ${PROJECT_NAME}_build DEPENDS ${OJDKBUILD_DIR}/upstream/openjfx-8u/build/bundles/javafx-sdk-overlay.zip )

add_custom_target ( ${PROJECT_NAME}_image
        COMMAND if exist ${${PROJECT_NAME}_IMAGE} rd /s /q ${${PROJECT_NAME}_IMAGE}
        COMMAND mkdir ${${PROJECT_NAME}_IMAGE}
        COMMAND (robocopy ${OJDKBUILD_DIR}/upstream/openjfx-8u/build/bundles ${${PROJECT_NAME}_IMAGE} javafx-sdk-overlay.zip ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        COMMAND pushd ${${PROJECT_NAME}_IMAGE} && ${openjdk_TOOLS}/zip/unzip.exe -q javafx-sdk-overlay.zip && popd
        COMMAND (robocopy ${OJDKBUILD_DIR}/tools/toolchain/vs2017bt/VC/Redist/MSVC/14.12.25810/${${PROJECT_NAME}_REDIST_ARCH}/Microsoft.VC141.CRT
                ${${PROJECT_NAME}_IMAGE}/jre/bin concrt140.dll msvcp140.dll vcruntime140.dll ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        COMMAND ${CMAKE_COMMAND} -E remove ${${PROJECT_NAME}_IMAGE}/javafx-sdk-overlay.zip
        # sign binaries
        COMMAND ${${PROJECT_NAME}_OJFX_JAVA_HOME}/bin/jjs.exe ${openjdk_SIGNER_JVM_OPTS}
                ${openjdk_INSTALLER_RESOURCES_PATH}/signer.js
                ${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Creating OpenJFX image, path: [${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}] ..." )
add_dependencies ( ${PROJECT_NAME}_image ${PROJECT_NAME}_build )

add_custom_target ( ${PROJECT_NAME}_zip
        COMMAND ${openjdk_TOOLS}/zip/zip.exe -qr${openjdk_COMPRESS_LEVEL} ${${PROJECT_NAME}_IMAGE}.zip ${${PROJECT_NAME}_IMAGE}
        COMMAND (robocopy ${CMAKE_CURRENT_BINARY_DIR} ${openjdk_DEST_DIR} ${${PROJECT_NAME}_IMAGE}.zip /mov ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Creating OpenJFX ZIP bundle ..." )
add_dependencies ( ${PROJECT_NAME}_zip ${PROJECT_NAME}_image )

add_custom_target ( ${PROJECT_NAME} )
add_dependencies ( ${PROJECT_NAME} ${PROJECT_NAME}_zip )

# installer
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/installer.xsl
        ${CMAKE_CURRENT_BINARY_DIR}/installer.xsl )
