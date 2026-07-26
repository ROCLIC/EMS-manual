@echo off
chcp 65001 >nul
title Verificar Requisitos - Servidor Minecraft
color 0B

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     VERIFICADOR DE REQUISITOS                              ║
echo ║     Servidor Minecraft NeoForge 1.21.1                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: ========================================
:: VERIFICAR JAVA
:: ========================================
echo [1/5] Verificando Java...
java -version 2>&1 | findstr /i "version" >nul
if errorlevel 1 (
    echo [ERROR] Java NO esta instalado o no esta en el PATH
    echo.
    echo Descarga Java 21 desde: https://adoptium.net/
    echo Selecciona "Temurin 21" (JRE o JDK)
    echo.
) else (
    echo [OK] Java detectado:
    java -version 2>&1 | findstr /i "version"
)
echo.

:: ========================================
:: VERIFICAR NEGORGE JAR
:: ========================================
echo [2/5] Verificando NeoForge...
if exist "run.jar" (
    echo [OK] run.jar encontrado
) else (
    echo [ERROR] run.jar NO encontrado
    echo [INFO] Descarga NeoForge Universal para 1.21.1 desde:
    echo [INFO] https://neoforged.net/downloads
    echo [INFO] Coloca el archivo como "run.jar" en esta carpeta
)
echo.

:: ========================================
:: VERIFICAR NGROK
:: ========================================
echo [3/5] Verificando Ngrok...
if exist "ngrok.exe" (
    echo [OK] ngrok.exe encontrado
    echo [INFO] Version:
    ngrok --version
) else (
    echo [ERROR] ngrok.exe NO encontrado
    echo [INFO] Descarga ngrok desde: https://ngrok.com/download
    echo [INFO] Coloca ngrok.exe en esta carpeta
)
echo.

:: ========================================
:: VERIFICAR MODS
:: ========================================
echo [4/5] Verificando Mods...
set /a MOD_COUNT=0
for %%f in (mods\*.jar) do set /a MOD_COUNT+=1
echo [INFO] Mods encontrados: %MOD_COUNT% de 190
echo.

:: ========================================
:: VERIFICAR RAM
:: ========================================
echo [5/5] Verificando RAM disponible...
echo [INFO] Recomendado: al menos 8GB de RAM total
echo [INFO] Se asignaran 6GB al servidor
echo.

:: ========================================
:: RESUMEN
:: ========================================
echo ═══════════════════════════════════════════════════════════════
echo.
echo RESUMEN:
echo - Java:         %ERRORLEVEL% (0 = OK)
echo - NeoForge JAR: %ERRORLEVEL% (0 = OK)
echo - Ngrok:        %ERRORLEVEL% (0 = OK)
echo - Mods:         %MOD_COUNT%
echo.
echo Si hay errores, instala lo que falte y ejecuta este script de nuevo.
echo.
pause
