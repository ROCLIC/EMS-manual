@echo off
chcp 65001 >nul
title Servidor Minecraft NeoForge 1.21.1 - Ngrok
color 0A

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     SERVIDOR MINECRAFT NEOFORGE 1.21.1                     ║
echo ║     Con Ngrok para jugar online con amigos                 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: ========================================
:: CONFIGURACION - MODIFICA AQUI SI NECESITAS
:: ========================================
set RAM_MAX=6G
set RAM_MIN=2G
set SERVER_PORT=25565
set NGROK_AUTH_TOKEN=TU_TOKEN_AQUI
set NEOFORGE_VERSION=21.1.90

:: ========================================
:: VERIFICAR QUE EXISTE EL JAR DE NEOFORGE
:: ========================================
if not exist "run.jar" (
    echo [ERROR] No se encontro run.jar (NeoForge)
    echo.
    echo Debes colocar el archivo run.jar de NeoForge 1.21.1 en esta carpeta.
    echo Puedes descargarlo desde: https://neoforged.net/
    echo.
    echo Busca el instalador "Universal" y coloca el archivo jar aqui.
    echo.
    pause
    exit /b 1
)

:: ========================================
:: VERIFICAR CARPETA DE MODS
:: ========================================
if not exist "mods" (
    echo [INFO] Creando carpeta de mods...
    mkdir mods
)

set /a MOD_COUNT=0
for %%f in (mods\*.jar) do set /a MOD_COUNT+=1
echo [INFO] Mods detectados: %MOD_COUNT%

:: ========================================
:: VERIFICAR NGROK
:: ========================================
if not exist "ngrok.exe" (
    echo [ERROR] No se encontro ngrok.exe
    echo.
    echo Descarga ngrok desde: https://ngrok.com/download
    echo Coloca ngrok.exe en esta misma carpeta.
    echo.
    pause
    exit /b 1
)

:: ========================================
:: ACEPTAR EULA
:: ========================================
if not exist "eula.txt" (
    echo [INFO] Aceptando EULA de Minecraft...
    echo eula=true > eula.txt
) else (
    findstr /i "eula=true" eula.txt >nul
    if errorlevel 1 (
        echo [INFO] Actualizando EULA...
        echo eula=true > eula.txt
    )
)

:: ========================================
:: INICIAR SERVIDOR MINECRAFT
:: ========================================
echo.
echo [INFO] Iniciando servidor Minecraft NeoForge 1.21.1...
echo [INFO] RAM Asignada: %RAM_MAX% maxima / %RAM_MIN% minima
echo.

start "Minecraft_Server" java -Xms%RAM_MIN% -Xmx%RAM_MAX% -jar run.jar nogui

echo [INFO] Esperando que el servidor cargue (30 segundos)...
timeout /t 30 /nobreak >nul

:: ========================================
:: INICIAR NGROK
:: ========================================
echo.
echo [INFO] Verificando token de ngrok...
if "%NGROK_AUTH_TOKEN%"=="TU_TOKEN_AQUI" (
    echo [ADVERTENCIA] No has configurado tu token de ngrok.
    echo [ADVERTENCIA] Ngrok se iniciara sin autenticacion.
    echo [ADVERTENCIA] Solo tendras 2 horas de conexion.
    echo.
    echo Para configurar tu token:
    echo 1. Ve a https://dashboard.ngrok.com/get-started/your-authtoken
    echo 2. Copia tu token
    echo 3. Reemplaza TU_TOKEN_AQUI en este archivo
    echo.
) else (
    echo [INFO] Autenticando con ngrok...
    ngrok config add-authtoken %NGROK_AUTH_TOKEN%
)

echo.
echo [INFO] Iniciando ngrok en puerto %SERVER_PORT%...
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║  Tu servidor esta listo! Tu amigo puede conectarse          ║
echo ║  usando la direccion que aparece en la ventana de ngrok    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

start "Ngrok" ngrok tcp %SERVER_PORT%

echo.
echo [INFO] Servidor y ngrok iniciados!
echo [INFO] Tu amigo debe conectarse a la direccion TCP de ngrok
echo [INFO] (ejemplo: tcp://0.tcp.ngrok.io:12345)
echo.
echo [INFO] Para detener: Cierra la ventana de ngrok y
echo        escribe "stop" en la consola del servidor.
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

:: ========================================
:: MANTENER VENTANA ABIERTA
:: ========================================
pause
