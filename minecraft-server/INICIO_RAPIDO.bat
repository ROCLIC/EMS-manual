@echo off
chcp 65001 >nul
title Inicio Rapido - Servidor Minecraft NeoForge 1.21.1
color 0A
mode con: cols=80 lines=30

echo.
echo  ================================================
echo   SERVIDOR MINECRAFT NEOFORGE 1.21.1
echo   Modo Inicio Rapido
echo  ================================================
echo.

:: Verificar requisitos basicos
if not exist "run.jar" (
    echo  [!] run.jar no encontrado!
    echo  [!] Ejecuta CONFIGURAR_SERVER.bat primero
    pause
    exit /b 1
)

if not exist "ngrok.exe" (
    echo  [!] ngrok.exe no encontrado!
    echo  [!] Ejecuta DESCARGAR_NGROK.bat primero
    pause
    exit /b 1
)

:: Aceptar EULA
echo eula=true > eula.txt

:: Contar mods
set MODS=0
for %%f in (mods\*.jar) do set /a MODS+=1
echo  Mods: %MODS%

:: Iniciar servidor
echo.
echo  Iniciando servidor...
start "Minecraft_Server" java -Xms2G -Xmx6G -jar run.jar nogui

echo  Esperando 30 segundos para que cargue...
timeout /t 30 /nobreak >nul

:: Iniciar ngrok
echo  Iniciando ngrok...
start "Ngrok" ngrok tcp 25565

echo.
echo  ================================================
echo   SERVIDOR INICIADO!
echo   Abre la ventana de Ngrok para ver tu direccion
echo   Tu amigo conecta a: tcp://[direccion_ngrok]
echo  ================================================
echo.
echo  Escribe "stop" en la ventana del servidor para cerrar.
echo.
pause
