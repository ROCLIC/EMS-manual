@echo off
chcp 65001 >nul
title Descargar Ngrok
color 0E

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     DESCARGADOR AUTOMATICO DE NGROK                        ║
echo ║     Para servidor Minecraft NeoForge 1.21.1                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: Verificar si ya existe
if exist "ngrok.exe" (
    echo [INFO] ngrok.exe ya existe en esta carpeta.
    echo [INFO] Si quieres actualizarlo, elimina ngrok.exe y vuelve a ejecutar.
    echo.
    pause
    exit /b 0
)

echo [INFO] Descargando ngrok para Windows amd64...
echo.

:: Descargar ngrok
powershell -Command "Invoke-WebRequest -Uri 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip' -OutFile 'ngrok.zip'"

if errorlevel 1 (
    echo [ERROR] Error al descargar ngrok.
    echo [INFO] Descargalo manualmente desde: https://ngrok.com/download
    echo.
    pause
    exit /b 1
)

echo [INFO] Extrayendo ngrok...
powershell -Command "Expand-Archive -Path 'ngrok.zip' -DestinationPath '.' -Force"

if exist "ngrok.exe" (
    del ngrok.zip
    echo.
    echo [OK] Ngrok descargado y listo!
    echo [OK] ngrok.exe esta en esta carpeta.
    echo.
    echo [SIGUIENTE PASO]
    echo 1. Crea una cuenta en https://ngrok.com
    echo 2. Ve a https://dashboard.ngrok.com/get-started/your-authtoken
    echo 3. Copia tu token y pegalo en INICIAR_SERVIDOR.bat
    echo    Reemplaza: TU_TOKEN_AQUI
    echo.
) else (
    echo [ERROR] No se pudo extraer ngrok.
    echo [INFO] Descargalo manualmente desde: https://ngrok.com/download
)

echo.
pause
