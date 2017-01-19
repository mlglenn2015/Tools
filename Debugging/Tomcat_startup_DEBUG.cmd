@ECHO OFF
setlocal
title MYAPPLICATION startup in debug mode

rem Change these to reflect your environment
set NUMBER_OF_THREADS=10
@REM set MANAGED_SERVER_NAME=
@REM set DOMAIN_DIR=C:\Oracle\Middleware\Oracle_Home\user_projects\domains\mydomain
set JAVA_HOME=C:\Java\jdk1.8.0_65

@REM ########################################################################################################
@REM set JAVA_OPTIONS=%JAVA_OPTIONS% -Xrunjdwp:transport=dt_socket,address=10171,server=y,suspend=n -Xmx512m -XX:MaxPermSize=256m -Dspring.profiles.active=dev -DENVIRONMENT=dev -Djavax.net.ssl.keyStore=C:\Users\keystore.jks -Djavax.net.ssl.keyStorePassword= -Djavax.net.ssl.password= -Djavax.net.ssl.trustStore=C:\Java\jdk1.8.0_65\jre\lib\security\cacerts -Dweblogic.security.SSL.trustedCAKeyStore=C:\Java\jdk1.8.0_65\jre\lib\security\cacerts  -Djavax.net.ssl.trustStore.password= -Dapp.jpa.logging=SEVERE -Dweblogic.security.allowCryptoJDefaultJCEVerification=true
@REM ########################################################################################################

echo "Tomcat_startup_DEBUG.cmd: Starting MYAPPLICATION ..."
echo JAVA_OPTIONS=%JAVA_OPTIONS%
echo NUMBER_OF_THREADS=%NUMBER_OF_THREADS%
echo DOMAIN_DIR=%DOMAIN_DIR%
echo JAVA_HOME=%JAVA_HOME%

@REM http://localhost:8080
java -Xrunjdwp:transport=dt_socket,address=10171,server=y,suspend=n -Xmx512m -Dspring.profiles.active=dev -DENVIRONMENT=dev -jar reactGUI.jar
endlocal