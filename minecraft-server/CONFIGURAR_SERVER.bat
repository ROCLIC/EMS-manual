@echo off
chcp 65001 >nul
title Configurar Servidor Minecraft NeoForge
color 0D

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     CONFIGURACION DEL SERVIDOR                             ║
echo ║     Minecraft NeoForge 1.21.1                              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

:: ========================================
:: PASO 1: ACEPTAR EULA
:: ========================================
echo [PASO 1] Aceptando el acuerdo EULA de Mojang...
echo eula=true > eula.txt
echo [OK] EULA aceptada.
echo.

:: ========================================
:: PASO 2: VERIFICAR CARPETAS
:: ========================================
echo [PASO 2] Verificando carpetas del servidor...
if not exist "mods" mkdir mods
if not exist "config" mkdir config
if not exist "logs" mkdir logs
if not exist "scripts" mkdir scripts
echo [OK] Carpetas creadas/verificadas.
echo.

:: ========================================
:: PASO 3: INSTRUCCIONES DE NEOFORGE
:: ========================================
echo [PASO 3] NeoForge - Instrucciones:
echo ─────────────────────────────────────────────────────────────
echo.
echo Para obtener run.jar:
echo 1. Ve a https://neoforged.net/downloads
echo 2. Selecciona Minecraft 1.21.1
echo 3. Descarga el archivo "Universal" (no el installer)
echo 4. Renombralo a "run.jar" y colocalo en esta carpeta
echo.
echo ALTERNATIVA - Usando el installer:
echo 1. Descarga NeoForge Installer para 1.21.1
echo 2. Ejecuta: java -jar neoforge-installer.jar --installServer
echo 3. Se generara run.jar automaticamente
echo.

:: ========================================
:: PASO 4: INSTRUCCIONES DE NGROK
:: ========================================
echo [PASO 4] Ngrok - Instrucciones:
echo ─────────────────────────────────────────────────────────────
echo.
echo 1. Crea una cuenta gratis en https://ngrok.com
echo 2. Ve a https://dashboard.ngrok.com/get-started/your-authtoken
echo 3. Copia tu authtoken
echo 4. Abre INICIAR_SERVIDOR.bat con un editor de texto
echo 5. Reemplaza "TU_TOKEN_AQUI" con tu token
echo.
echo O usa DESCARGAR_NGROK.bat para descargar ngrok automaticamente.
echo.

:: ========================================
:: PASO 5: RESUMEN FINAL
:: ========================================
echo ═══════════════════════════════════════════════════════════════
echo.
echo ARCHIVOS QUE NECESITAS:
echo   - run.jar          (NeoForge Universal para 1.21.1)
echo   - ngrok.exe         (descargado o via DESCARGAR_NGROK.bat)
echo   - mods\*.jar        (tus 190 mods)
echo.
echo ORDEN DE INICIO:
echo   1. VERIFICAR_REQUISITOS.bat  (primera vez)
echo   2. INICIAR_SERVIDOR.bat      (cada vez que quieras jugar)
echo   3. DETENER_SERVIDOR.bat      (cuando terminen de jugar)
echo.
echo COMO JUGAR:
echo   Tu amigo conecta a la direccion TCP de ngrok
echo   Ejemplo: In-game Multiplayer → Direct Connect → 0.tcp.ngrok.io:12345
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
pause
