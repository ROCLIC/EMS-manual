# EMS-manual

Servidor Minecraft NeoForge 1.21.1 con Ngrok para jugar con amigos.

---

## Estructura del Proyecto

```
minecraft-server/
├── INICIAR_SERVIDOR.bat      ← Script principal (inicia servidor + ngrok)
├── INICIO_RAPIDO.bat          ← Inicio rápido (versión simplificada)
├── CONFIGURAR_SERVER.bat      ← Guía interactiva de configuración
├── DESCARGAR_NGROK.bat        ← Descarga ngrok automáticamente
├── VERIFICAR_REQUISITOS.bat   ← Verifica que todo esté instalado
├── DETENER_SERVIDOR.bat       ← Detiene servidor y ngrok
├── server.properties          ← Configuración del servidor
├── eula.txt                   ← (se genera automáticamente)
├── mods/                      ← Aquí van tus 190 mods (.jar)
│   └── LEEME.txt
├── config/                    ← Configuraciones de mods (se genera)
├── scripts/                   ← Scripts adicionales
├── logs/                      ← Logs del servidor
└── world/                     ← Mundo del juego (se genera)
```

## Requisitos

| Requisito | Detalle |
|-----------|---------|
| **Java** | Java 21 (JRE o JDK) |
| **RAM** | Mínimo 8GB (se asignan 6GB al servidor) |
| **NeoForge** | run.jar para Minecraft 1.21.1 |
| **Ngrok** | ngrok.exe (cuenta gratis) |
| **Mods** | 190 mods en .jar dentro de la carpeta `mods/` |

---

## Guía Rápida

### Paso 1: Instalar Java 21

Descarga Java 21 desde [Adoptium](https://adoptium.net/) (selecciona Temurin 21).

### Paso 2: Obtener NeoForge

1. Ve a [neoforged.net/downloads](https://neoforged.net/downloads)
2. Selecciona Minecraft **1.21.1**
3. Descarga el archivo **Universal** (no el installer)
4. Renómbralo a `run.jar` y colócalo en la carpeta `minecraft-server/`

**Alternativa con installer:**
```bat
java -jar neoforge-installer.jar --installServer
```

### Paso 3: Descargar Ngrok

Ejecuta `DESCARGAR_NGROK.bat` o descarga manualmente desde [ngrok.com/download](https://ngrok.com/download).

### Paso 4: Configurar tu Token de Ngrok

1. Crea cuenta gratis en [ngrok.com](https://ngrok.com)
2. Ve a [dashboard.ngrok.com/get-started/your-authtoken](https://dashboard.ngrok.com/get-started/your-authtoken)
3. Copia tu token
4. Abre `INICIAR_SERVIDOR.bat` con bloc de notas
5. Reemplaza `TU_TOKEN_AQUI` con tu token real

### Paso 5: Colocar los Mods

Copia tus **190 mods** (.jar) dentro de la carpeta `mods/`.

### Paso 6: ¡Jugar!

**Para iniciar:**
- Opción 1: Ejecuta `INICIAR_SERVIDOR.bat` (completo, con configuración)
- Opción 2: Ejecuta `INICIO_RAPIDO.bat` (versión rápida)

**Para detener:**
- Escribe `stop` en la ventana del servidor, o ejecuta `DETENER_SERVIDOR.bat`

---

## Cómo conectarse

Tu amigo debe:
1. Abrir Minecraft con los **mismos 190 mods** instalados
2. Ir a **Multiplayer → Direct Connect**
3. Ingresar la dirección que aparece en la ventana de ngrok (ejemplo: `0.tcp.ngrok.io:12345`)

---

## Configuración de RAM

Para cambiar la RAM asignada, edita `INICIAR_SERVIDOR.bat` y modifica:

```bat
set RAM_MAX=6G
set RAM_MIN=2G
```

| RAM Total | RAM_MAX | RAM_MIN |
|-----------|---------|---------|
| 8 GB | 4G | 2G |
| 12 GB | 6G | 3G |
| 16 GB | 8G | 4G |
| 32 GB | 12G | 6G |

---

## Resolución de Problemas

| Problema | Solución |
|----------|----------|
| `run.jar` no encontrado | Descarga NeoForge Universal y colócalo como `run.jar` |
| `ngrok.exe` no encontrado | Ejecuta `DESCARGAR_NGROK.bat` |
| Error de Java | Instala Java 21 y reinicia |
| Mods no cargan | Verifica que sean para NeoForge 1.21.1 |
| Ngrok se cierra a las 2h | Configura tu authtoken en `INICIAR_SERVIDOR.bat` |
| Servidor lento | Reduce `view-distance` en `server.properties` a 6 |