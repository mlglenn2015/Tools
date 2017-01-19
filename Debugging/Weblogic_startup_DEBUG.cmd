@ECHO OFF
setlocal

title MYAPPLICATION WebLogic 12c Managed Server

rem Change these to reflect your environment
set NUMBER_OF_THREADS=10
set MANAGED_SERVER_NAME=managed01
set DOMAIN_DIR=C:\Oracle\Middleware\Oracle_Home\user_projects\domains\mydomain
set JAVA_HOME=C:\Java\jdk1.8.0_65

set SSL_KEYSTORE=C:\Users\mykeystore.jks
set SSL_KEYSTORE_PASSWD=
set SSL_PASSWD=
set SSL_TRUST_STORE=C:\Java\jdk1.8.0_65\jre\lib\security\cacerts
set SSL_CA_TRUST_STORE=C:\Java\jdk1.8.0_65\jre\lib\security\cacerts
set SSL_TRUST_STORE_PASSWD=

@REM ########################################################################################################
@REM USER DEFINED OPTIONS FOR Weblogic 12c

set JAVA_OPTIONS=%JAVA_OPTIONS% -Xrunjdwp:transport=dt_socket,address=10171,server=y,suspend=n -Xmx512m -XX:MaxPermSize=256m -debug

set JAVA_OPTIONS=%JAVA_OPTIONS% -Djavax.net.ssl.keyStore=%SSL_KEYSTORE% -Djavax.net.ssl.keyStorePassword=%SSL_KEYSTORE_PASSWD% -Djavax.net.ssl.password=%SSL_PASSWD% -Djavax.net.ssl.trustStore=%SSL_TRUST_STORE% -Dweblogic.security.SSL.trustedCAKeyStore=%SSL_CA_TRUST_STORE% -Djavax.net.ssl.trustStore.password=%SSL_TRUST_STORE_PASSWD%

set JAVA_OPTIONS=%JAVA_OPTIONS% -DENVIRONMENT=local -Dspring.profiles.active=local -DAPP_LOG_LOCATION=C:\etc\log -Dapp.soap.tracing=true -Dapp.jpa.logging=SEVERE

set JAVA_OPTIONS=%JAVA_OPTIONS% -Dweblogic.security.allowCryptoJDefaultJCEVerification=true -Dweblogic.ProductionModeEnabled=false
@REM ########################################################################################################

echo "Weblogic_startup_DEBUG.cmd: Starting Weblogic..."
echo JAVA_OPTIONS=%JAVA_OPTIONS%
echo NUMBER_OF_THREADS=%NUMBER_OF_THREADS%
echo DOMAIN_DIR=%DOMAIN_DIR%
echo JAVA_HOME=%JAVA_HOME%

cd %DOMAIN_DIR%\bin
startManagedWebLogic.cmd %MANAGED_SERVER_NAME% http://localhost:7001
endlocal
