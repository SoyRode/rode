# 🚀 GUÍA DE COMPILACIÓN APK

## Opción 1: Usar Script Automático (RECOMENDADO)

**Lo más fácil - 1 solo paso:**

```powershell
cd C:\AppCelulares\itp_irpf_calculator
.\build_apk.bat
```

El script automáticamente:
- ✅ Detecta si tienes Docker
- ✅ Si tienes Docker → Compila en contenedor
- ✅ Si no → Descarga Flutter automáticamente
- ✅ Compila el APK
- ✅ Te muestra la ruta del archivo

---

## Opción 2: Compilación en GitHub Actions (LA MEJOR)

### Paso 1: Subir código a GitHub

```powershell
cd C:\AppCelulares\itp_irpf_calculator

# Inicializar git (si no está hecho)
git init
git add .
git commit -m "Initial commit - ITP IRPF Calculator"

# Crear repositorio en GitHub y añadirlo
git remote add origin https://github.com/TU_USUARIO/itp-irpf-calculator.git
git push -u origin main
```

### Paso 2: GitHub compilará automáticamente

- Cada vez que hagas `push` → GitHub compila APK automáticamente
- Descargas en: **Actions** → **Build APK** → **Artifacts**
- No necesitas instalar nada localmente
- **Completamente gratis**

### Paso 3: Crear releases automáticas

```powershell
# Crear tag para release
git tag v1.0.0
git push origin v1.0.0
```

GitHub creará automáticamente una **Release** con el APK descargable.

---

## Opción 3: Compilar Localmente (SIN Docker)

Si quieres instalar Flutter permanentemente:

### Paso 1: Descargar Flutter

Descarga desde: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.6-stable.zip

O usa PowerShell:

```powershell
$url = 'https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.6-stable.zip'
$output = 'C:\flutter.zip'
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
(New-Object System.Net.WebClient).DownloadFile($url, $output)
Expand-Archive -Path $output -DestinationPath C:\ -Force
```

### Paso 2: Agregar Flutter al PATH

1. Presiona `Win + X` → "Variables de entorno"
2. En "Variables del sistema" → Edita `PATH`
3. Agrega: `C:\flutter\bin`
4. Reinicia PowerShell

### Paso 3: Verificar instalación

```powershell
flutter doctor
```

Debería mostrar verde. Si dice que falta Android SDK:

```powershell
flutter doctor --android-licenses
# Presiona 'y' para aceptar todas las licencias
```

### Paso 4: Compilar APK

```powershell
cd C:\AppCelulares\itp_irpf_calculator
flutter clean
flutter pub get
flutter build apk --release
```

**Resultado:** `build\app\outputs\flutter-app.apk` (50-60 MB)

---

## Opción 4: Compilar con Docker (SI LO TIENES)

```powershell
cd C:\AppCelulares\itp_irpf_calculator

docker run --rm -v ${PWD}:/workspace flutter:latest sh -c `
  "cd /workspace && flutter clean && flutter pub get && flutter build apk --release"
```

---

## 📱 Después de compilar: Instalar en móvil

### Vía USB (si tienes cable)

```powershell
# Ver dispositivos conectados
flutter devices

# Instalar APK
flutter install build/app/outputs/flutter-app.apk
```

### Vía QR o descarga

1. Comparte el APK por:
   - **WhatsApp**
   - **Email**
   - **Google Drive**
   - **OneDrive**

2. En tu móvil:
   - Descarga el APK
   - Abre "Archivos" o "My Files"
   - Busca el APK y toca para instalar
   - Si pregunta "¿Permitir instalación de apps desconocidas?" → Sí

---

## ❓ Solucionar Problemas

### "flutter: command not found"
→ Flutter no está en PATH. Instálalo o usa `build_apk.bat`

### "Android SDK not found"
→ Ejecuta: `flutter doctor --android-licenses` y acepta todas

### "JAVA_HOME not set"
→ Ejecuta: `flutter doctor` para detalles

### "Gradle build failed"
→ Ejecuta: `flutter clean` y luego `flutter build apk --release`

### La descarga es muy lenta
→ Usa GitHub Actions (compilación en la nube, sin descargas locales)

---

## 🎯 Recomendación Final

**MEJOR OPCIÓN → GitHub Actions**

Ventajas:
- ✅ 0 instalaciones locales
- ✅ Compila automáticamente cada push
- ✅ Gratis
- ✅ 1 click para descargar APK
- ✅ Puedes compilar desde cualquier dispositivo

Solo necesitas:
1. Cuenta GitHub (gratis)
2. Subir código a repositorio
3. Los archivos `.github/workflows/build_apk.yml` ya están incluidos

¡Listo! 🚀

---

## 📊 Comparación de Métodos

| Método | Instalación | Tiempo | Dificultad | Recomendado |
|--------|------------|--------|-----------|------------|
| Script `build_apk.bat` | 2 min | 10-15 min | Muy fácil | ⭐⭐⭐ |
| GitHub Actions | 0 min | 15-20 min | Muy fácil | ⭐⭐⭐⭐⭐ |
| Flutter local | 15 min | 10-15 min | Media | ⭐⭐ |
| Docker | Depende | 10-15 min | Difícil | ⭐ |

