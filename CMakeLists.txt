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
set ( ${PROJECT_NAME}_UPDATE "152" CACHE STRING "Version string 'update' field" )
set ( ${PROJECT_NAME}_BUILD "04" CACHE STRING "Version string 'build' field" )
set ( ${PROJECT_NAME}_OJFX_COMPILE_MEDIA "true" CACHE STRING "Enable 'media' module for OpenJFX" )
set ( ${PROJECT_NAME}_OJFX_JAVA_HOME ${CMAKE_CURRENT_BINARY_DIR}/../${openjdk_IMAGE} CACHE STRING "Path to jdk to use for building OpenJFX" )
#set ( ${PROJECT_NAME}_OJFX_JAVA_HOME ${openjdk_TOOLS}/bootjdk8 CACHE STRING "Path to jdk to use for building OpenJFX" )
set ( ${PROJECT_NAME}_INSTALLER_PRODUCT_UUID "0d8201c2-cde1-4c85-9fee-288a7f5fbce0" CACHE STRING "Installer product UUID" )
set ( ${PROJECT_NAME}_INSTALLER_UPDATE_UUID "0cfe5d7f-c68c-45ab-ac7c-6286a1dcb6f4" CACHE STRING "Installer update UUID" )
set ( ${PROJECT_NAME}_INSTALLER_APP_NAME "OpenJFX ${openjdk_MAJOR_VERSION}.0_${${PROJECT_NAME}_UPDATE}-${openjdk_RPMBUILD}-${openjdk_MILESTONE} (experimental)" CACHE STRING "Installer app name" )

# image naming
set ( ${PROJECT_NAME}_BASE openjfx-${openjdk_MAJOR_VERSION}.0.${${PROJECT_NAME}_UPDATE}-${openjdk_RPMBUILD}.b${${PROJECT_NAME}_BUILD}.${openjdk_MILESTONE}.windows )
set ( ${PROJECT_NAME}_IMAGE ${${PROJECT_NAME}_BASE}.${openjdk_ARCH} )

# build config
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/gradle.properties
        ${OJDKBUILD_DIR}/upstream/openjfx-8u )
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/build.properties
        ${OJDKBUILD_DIR}/upstream/openjfx-8u )        
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/run-gradle.bat
        ${OJDKBUILD_DIR}/upstream/openjfx-8u )
configure_file ( ${CMAKE_CURRENT_LIST_DIR}/resources/installer.json
        ${CMAKE_CURRENT_BINARY_DIR} )        

# targets        
add_custom_target ( ${PROJECT_NAME}
        COMMAND cmd /c run-gradle.bat
        WORKING_DIRECTORY ${OJDKBUILD_DIR}/upstream/openjfx-8u
        COMMENT "Building OpenJFX ..." )
        
add_custom_target ( ${PROJECT_NAME}_image        
        COMMAND ${CMAKE_COMMAND} -E make_directory ${${PROJECT_NAME}_IMAGE}
        COMMAND (robocopy ${OJDKBUILD_DIR}/upstream/openjfx-8u/build/bundles ${${PROJECT_NAME}_IMAGE} javafx-sdk-overlay.zip /mov ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
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

add_custom_target ( ${PROJECT_NAME}_installer
        COMMAND ${CMAKE_COMMAND} -E remove ${${PROJECT_NAME}_IMAGE}.wxs
        COMMAND ${${PROJECT_NAME}_OJFX_JAVA_HOME}/bin/java.exe
                -XX:+UseSerialGC -XX:+TieredCompilation -XX:TieredStopAtLevel=1
                -jar ${openjdk_TOOLS}/wixgen/wixgen.jar
                ${${PROJECT_NAME}_IMAGE}
                -c ${CMAKE_CURRENT_BINARY_DIR}/installer.json
                -o ${${PROJECT_NAME}_IMAGE}.wxs
        COMMAND ${openjdk_TOOLS}/wix/bin/candle -v -nologo ${${PROJECT_NAME}_IMAGE}.wxs
        COMMAND ${openjdk_TOOLS}/wix/bin/light 
                -v -nologo -sw1076 -ext WixUIExtension -ext WixUtilExtension
                ${openjdk_INSTALLER_LINKER_OPTIONS}
                ${${PROJECT_NAME}_IMAGE}.wixobj
        COMMAND (robocopy ${CMAKE_CURRENT_BINARY_DIR} ${openjdk_DEST_DIR} ${${PROJECT_NAME}_IMAGE}.msi /mov ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}        
        COMMENT "Creating OpenJFX MSI installer ..." )
add_dependencies ( ${PROJECT_NAME}_installer ${PROJECT_NAME}_zip )      
        