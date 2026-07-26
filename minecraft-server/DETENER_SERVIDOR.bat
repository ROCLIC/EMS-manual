@echo off
chcp 65001 >nul
title Detener Servidor Minecraft
color 0C

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     DETENER SERVIDOR MINECRAFT                             ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: Cerrar ngrok
taskkill /fi "WINDOWTITLE eq Ngrok" /im ngrok.exe /f >nul 2>&1
echo [INFO] Ngrok detenido.

:: Cerrar el servidor
taskkill /fi "WINDOWTITLE eq Minecraft_Server" /im java.exe /f >nul 2>&1
echo [INFO] Servidor Minecraft detenido.

echo.
echo [OK] Todo detenido. Guarda de mundo completada.
echo.
pause
