# 📖 GUÍA PASO A PASO: GitHub Actions (SIN INSTALAR NADA)

## 🎯 Objetivo
Compilar el APK automáticamente en GitHub sin instalar Flutter, Git ni nada en tu PC.

---

## PASO 1️⃣: Crear Cuenta GitHub (5 minutos)

1. Ve a https://github.com
2. Haz clic en **Sign up**
3. Sigue los pasos:
   - Email
   - Contraseña
   - Username (ej: `tu-usuario`)
   - Verifica email

✅ Listo, ahora tienes cuenta GitHub

---

## PASO 2️⃣: Crear Repositorio (2 minutos)

1. Inicia sesión en https://github.com
2. En la esquina superior derecha → **+** → **New repository**
3. Rellena:
   - **Repository name**: `itp-irpf-calculator`
   - **Description**: `Calculadora de ITP e IRPF para Uruguay`
   - **Public** o **Private** (como prefieras)
   - ✅ **Add a README file**
   - ✅ **Add .gitignore** → Selecciona "Dart"
   - Haz clic en **Create repository**

✅ Tu repositorio está creado

---

## PASO 3️⃣: Subir Archivos (3 minutos - CON INTERFAZ WEB)

### OPCIÓN A: Upload directo en GitHub (MÁS FÁCIL)

1. En tu repositorio, haz clic en **Add file** → **Upload files**
2. Selecciona todos los archivos de `C:\AppCelulares\itp_irpf_calculator` EXCEPTO:
   - `build/` (carpeta de compilación)
   - `.dart_tool/` (carpeta de caché)
   - `.flutter-plugins`

3. GitHub los subirá automáticamente
4. Escribe mensaje: `Initial commit - Complete project`
5. Haz clic **Commit changes**

✅ Archivos subidos

---

### OPCIÓN B: Con Command Line (5 minutos - requiere PowerShell)

Si quieres usar terminal, crea este script:

**Archivo: `C:\AppCelulares\push_to_github.ps1`**

```powershell
# Script para subir a GitHub sin Git instalado

# 1. Descargar Git Portable
Write-Host "Descargando Git portable..." -ForegroundColor Cyan

$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.44.0.windows.1/PortableGit-2.44.0-64-bit.7z.exe"
$gitPath = "$PSScriptRoot\PortableGit.exe"

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
(New-Object System.Net.WebClient).DownloadFile($gitUrl, $gitPath)

Write-Host "✓ Git descargado" -ForegroundColor Green

# 2. Extraer
Write-Host "Extrayendo Git..." -ForegroundColor Cyan
& $gitPath -o "$PSScriptRoot\git-portable" -y
$env:PATH = "$PSScriptRoot\git-portable\cmd;$env:PATH"

Write-Host "✓ Git instalado" -ForegroundColor Green

# 3. Configurar Git
Write-Host "Configurando Git..." -ForegroundColor Cyan
git config --global user.name "ITP Developer"
git config --global user.email "dev@itp-irpf.com"

# 4. Inicializar repo
cd $PSScriptRoot
git init
git add .
git commit -m "Initial commit - Complete ITP IRPF Calculator"

# 5. Agregar remote
Write-Host "Introduce tu usuario de GitHub:" -ForegroundColor Yellow
$username = Read-Host "Username"
$repoName = "itp-irpf-calculator"

# La primera vez pedirá autenticación
git remote add origin "https://github.com/$username/$repoName.git"
git branch -M main
git push -u origin main

Write-Host "✓ Código subido a GitHub!" -ForegroundColor Green
Write-Host "Repositorio: https://github.com/$username/$repoName" -ForegroundColor Cyan
```

**Para ejecutar:**

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
C:\AppCelulares\itp_irpf_calculator\push_to_github.ps1
```

---

## PASO 4️⃣: Verificar que GitHub Actions se ejecutó (2 minutos)

1. Ve a tu repositorio: `https://github.com/TU_USUARIO/itp-irpf-calculator`
2. Haz clic en la pestaña **Actions**
3. Deberías ver **Build APK** en progreso o completado ✅

---

## PASO 5️⃣: Descargar el APK (1 minuto)

Una vez que **Build APK** muestre ✅ **PASSED**:

1. Haz clic en el flujo **Build APK**
2. Baja hasta **Artifacts**
3. Haz clic en **app-release.apk** para descargar
4. Se guardará en `Downloads/`

**¡YA TIENES TU APK LISTO!** 🎉

---

## PASO 6️⃣: Instalar en tu Móvil

### Opción A: Compartir el APK

```
1. Comparte Downloads/app-release.apk por:
   - WhatsApp
   - Gmail
   - Google Drive
   - OneDrive
   - AirDrop (si usas iPhone con jailbreak)

2. En tu móvil:
   - Descarga el APK
   - Abre la app "Archivos" o "My Files"
   - Busca el APK (app-release.apk)
   - Toca y selecciona "Instalar"
```

### Opción B: Usar GitHub Release (más profesional)

Cuando quieras hacer una versión oficial:

1. En tu repositorio, haz clic en **Releases** (lado derecho)
2. Haz clic en **Create a new release**
3. **Tag**: `v1.0.0`
4. **Title**: `Version 1.0.0 - ITP IRPF Calculator`
5. El APK se añadirá automáticamente
6. Haz clic **Publish release**
7. Ahora cualquiera puede descargar desde **Releases** 📦

---

## 🔄 Flujo de Trabajo Futuro

Cada vez que quieras compilar una nueva versión:

### Opción 1: Por web (sin instalar nada)

1. Ve a tu repositorio en GitHub
2. Edita un archivo (ej: README.md) y haz clic "Commit"
3. GitHub automáticamente compila el APK nuevamente
4. Descargalo de **Actions** → **Artifacts**

### Opción 2: Con Git instalado

```powershell
cd C:\AppCelulares\itp_irpf_calculator
git add .
git commit -m "Cambios en la app"
git push
# GitHub compila automáticamente
```

---

## 📋 Checklist de Configuración

- [ ] Cuenta GitHub creada
- [ ] Repositorio creado
- [ ] Archivos subidos
- [ ] Actions ejecutándose (ver pestaña Actions)
- [ ] APK compilado y listo para descargar
- [ ] APK instalado en móvil

---

## ❓ FAQ

**P: ¿Cuánto tiempo tarda la compilación?**
R: 15-20 minutos la primera vez, 10-15 minutos después

**P: ¿Puedo hacer esto desde el móvil?**
R: Sí, desde cualquier navegador. Ve a github.com, todo es gráfico

**P: ¿Qué pasa si cambio el código?**
R: Haz push y GitHub automáticamente recompila

**P: ¿Es gratis?**
R: Sí, 100% gratis. GitHub Actions tiene 2,000 minutos/mes gratis

**P: ¿Qué si quiero compilar con Android Studio?**
R: Necesitarías instalar Android Studio (~3GB), mejor usa GitHub Actions

**P: ¿El APK está firmado?**
R: Sí, GitHub lo firma automáticamente para poder instalarlo

---

## 🎯 Resumen Rápido

```
1. Crear cuenta: github.com
2. Crear repositorio: + → New Repository
3. Subir archivos: Add file → Upload files
4. Esperar: Actions → Build APK (15-20 min)
5. Descargar: Actions → Artifacts → app-release.apk
6. Instalar: Enviar APK al móvil → Instalar
7. ¡Listo! 🎉
```

---

**Preguntas?** Contacta al desarrollador.

