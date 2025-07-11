@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  sar startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and SAR_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\sar-1.3.0-SNAPSHOT.jar;%APP_HOME%\lib\analysis-1.3.0-SNAPSHOT.jar;%APP_HOME%\lib\common-1.3.0-SNAPSHOT.jar;%APP_HOME%\lib\kieker-2.0.0-SNAPSHOT.jar;%APP_HOME%\lib\teetime-3.1.1-SNAPSHOT.jar;%APP_HOME%\lib\jcommander-1.78.jar;%APP_HOME%\lib\logback-classic-1.4.7.jar;%APP_HOME%\lib\csveed-0.7.4.jar;%APP_HOME%\lib\architecture-evaluation-tool-0.0.4.jar;%APP_HOME%\lib\spoon-core-9.2.0-beta-5.jar;%APP_HOME%\lib\slf4j-api-2.0.12.jar;%APP_HOME%\lib\org.eclipse.emf.ecore.xmi-2.16.0.jar;%APP_HOME%\lib\org.eclipse.emf.ecore-2.23.0.jar;%APP_HOME%\lib\jackson-annotations-2.12.5.jar;%APP_HOME%\lib\jackson-core-2.12.5.jar;%APP_HOME%\lib\jackson-databind-2.12.5.jar;%APP_HOME%\lib\jaxb-impl-2.3.3.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.3.jar;%APP_HOME%\lib\commons-compress-1.21.jar;%APP_HOME%\lib\logback-access-1.4.7.jar;%APP_HOME%\lib\logback-core-1.4.7.jar;%APP_HOME%\lib\jctools-core-4.0.3.jar;%APP_HOME%\lib\guava-33.0.0-jre.jar;%APP_HOME%\lib\hppc-0.9.1.jar;%APP_HOME%\lib\commons-math3-3.6.1.jar;%APP_HOME%\lib\snakeyaml-2.0.jar;%APP_HOME%\lib\org.eclipse.emf.common-2.30.0.jar;%APP_HOME%\lib\jakarta.activation-api-1.2.2.jar;%APP_HOME%\lib\jakarta.activation-1.2.2.jar;%APP_HOME%\lib\failureaccess-1.0.2.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-3.41.0.jar;%APP_HOME%\lib\error_prone_annotations-2.23.0.jar;%APP_HOME%\lib\flogger-system-backend-0.6.jar;%APP_HOME%\lib\flogger-0.6.jar;%APP_HOME%\lib\org.eclipse.jdt.core-3.26.0.jar;%APP_HOME%\lib\jsap-2.1.jar;%APP_HOME%\lib\maven-invoker-3.1.0.jar;%APP_HOME%\lib\maven-shared-utils-3.3.3.jar;%APP_HOME%\lib\commons-io-2.11.0.jar;%APP_HOME%\lib\maven-model-3.8.2.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\checker-compat-qual-2.5.3.jar;%APP_HOME%\lib\plexus-utils-3.2.1.jar;%APP_HOME%\lib\javax.inject-1.jar


@rem Execute sar
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SAR_OPTS%  -classpath "%CLASSPATH%" org.oceandsl.tools.sar.StaticArchitectureRecoveryMain %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable SAR_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%SAR_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
