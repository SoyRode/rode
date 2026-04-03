@echo off
REM Script para compilar APK sin Flutter instalado localmente
REM Usa Docker si está disponible, si no, descarga Flutter automáticamente

setlocal enabledelayedexpansion

echo.
echo ========================================
echo   COMPILADOR APK - ITP IRPF CALCULATOR
echo ========================================
echo.

REM Verificar si Docker está disponible
docker --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [✓] Docker encontrado. Usando Docker...
    echo.
    call :build_with_docker
    goto :end
)

REM Si no hay Docker, descargar e instalar Flutter
echo [!] Docker no encontrado. Descargando Flutter...
call :build_with_flutter
goto :end

REM ===== FUNCIÓN: Compilar con Docker =====
:build_with_docker
docker run --rm -v "%cd%":/workspace flutter:latest sh -c "cd /workspace && flutter clean && flutter pub get && flutter build apk --release"
if %errorlevel% equ 0 (
    echo.
    echo [✓] APK compilado exitosamente!
    echo [✓] Ubicación: build\app\outputs\flutter-app.apk
) else (
    echo.
    echo [✗] Error durante la compilación
)
exit /b

REM ===== FUNCIÓN: Compilar con Flutter local =====
:build_with_flutter
set FLUTTER_HOME=%cd%\.flutter_cache

REM Crear directorio de caché
if not exist "%FLUTTER_HOME%" mkdir "%FLUTTER_HOME%"

REM Descargar Flutter
echo Descargando Flutter SDK (esto puede tomar unos minutos)...
powershell -Command ^
  "$ProgressPreference = 'SilentlyContinue'; ^
   [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; ^
   (New-Object System.Net.WebClient).DownloadFile( ^
     'https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.6-stable.zip', ^
     '%FLUTTER_HOME%\flutter.zip' ^
   ); ^
   Write-Host 'Descarga completada'"

if not exist "%FLUTTER_HOME%\flutter.zip" (
    echo [✗] Error: No se pudo descargar Flutter
    exit /b 1
)

REM Extraer Flutter
echo Extrayendo Flutter...
powershell -Command "Expand-Archive -Path '%FLUTTER_HOME%\flutter.zip' -DestinationPath '%FLUTTER_HOME%' -Force"

REM Compilar APK
echo Compilando APK...
set PATH=%FLUTTER_HOME%\flutter\bin;%PATH%
call flutter --version

if %errorlevel% equ 0 (
    echo.
    echo [✓] Flutter SDK instalado correctamente
    echo [✓] Compilando aplicación...
    echo.
    call flutter clean
    call flutter pub get
    call flutter build apk --release
    
    if %errorlevel% equ 0 (
        echo.
        echo [✓] APK compilado exitosamente!
        echo.
        echo Ubicación: build\app\outputs\flutter-app.apk
        echo.
        pause
    ) else (
        echo [✗] Error durante la compilación del APK
    )
) else (
    echo [✗] Error: No se pudo instalar Flutter
)

:end
echo.
echo Presiona cualquier tecla para salir...
pause >nul
