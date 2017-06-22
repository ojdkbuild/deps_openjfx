
rem ojfx env
set PATH=%PATH%;${OJDKBUILD_DIR}/tools/ant182/bin
set PATH=%PATH%;${OJDKBUILD_DIR}/tools/gradle18/bin
set PATH=%PATH%;${OJDKBUILD_DIR}/tools/cygwin64/bin
set DXSDK_DIR=${OJDKBUILD_DIR}/tools/toolchain/directx-june2010
set BASECLASSES_SDK_DIR=%WINDOWSSDKDIR%
set MSVCR100_DIR=${OJDKBUILD_DIR}/tools/toolchain/msvcr100/amd64

rem todo: removeme
set JAVA_HOME=C:/apps/jdk_amd64

rem build
rd /s /q .gradle
if exist ".gradle" exit /b 1
rd /s /q "buildSrc/.gradle"
if exist "buildSrc/.gradle" exit /b 1
cmd /c gradle cleanAll --refresh-dependencies --recompile-scripts --info || exit /b 1
cmd /c gradle assemble --refresh-dependencies --info || exit /b 1
cmd /c gradle test -x :web:test --refresh-dependencies --info || exit /b 1
cmd /c gradle zips -x :apps --refresh-dependencies --info || exit /b 1
