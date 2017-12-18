@echo off

rem Copyright 2017, akashche at redhat.com
rem
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

@echo on

rem env setup
call "${OJDKBUILD_DIR}/resources/scripts/set-compile-env-vs15-${${PROJECT_NAME}_TOOLCHAIN_ARCH}.bat"

rem freshly-built jdk
set JAVA_HOME=${${PROJECT_NAME}_OJFX_JAVA_HOME}

rem build
rd /s /q .gradle
if exist ".gradle" exit /b 1
rd /s /q "buildSrc/.gradle"
if exist "buildSrc/.gradle" exit /b 1
cmd /c gradle cleanAll --refresh-dependencies --recompile-scripts --info || exit /b 1
cmd /c gradle assemble --refresh-dependencies --info || exit /b 1
cmd /c gradle test --refresh-dependencies || exit /b 1
cmd /c gradle zips -x :apps --refresh-dependencies --info || exit /b 1
