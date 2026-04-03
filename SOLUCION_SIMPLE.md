# 🎯 SOLUCIÓN SIMPLE: Compilar APK sin instalar nada

## ✅ OPCIÓN MÁS FÁCIL - Solo 5 pasos en la web

### Paso 1: Abrir GitHub
- Ve a https://github.com
- Haz clic en **Sign up** (si no tienes cuenta)
- Sigue los pasos (email, contraseña, verificación)

### Paso 2: Crear repositorio
- Haz clic en el **+** arriba a la derecha
- **New repository**
- Nombre: `itp-irpf-calculator`
- ✅ Public
- ✅ Add a README file
- ✅ Add .gitignore → Dart
- **Create repository**

### Paso 3: Subir archivos
**En tu repositorio:**
- Clic en **Code** (verde)
- Clic en **Upload files**
- Arrastra TODA la carpeta `C:\AppCelulares\itp_irpf_calculator` aquí
  - (excepto: `build/`, `.dart_tool/`, `.git/`)

### Paso 4: Esperar compilación
- Clic en pestaña **Actions**
- Espera a que **Build APK** muestre ✅ verde
- Tarda **15-20 minutos**

### Paso 5: Descargar APK
- En **Actions**, clic en el flujo **Build APK**
- Baja a **Artifacts**
- Descarga **app-release.apk**
- Envía al móvil e instala

---

## ❌ Si el script PowerShell da error

```powershell
# Intenta esto en su lugar (más simple):

# 1. Ve a tu carpeta
cd C:\AppCelulares\itp_irpf_calculator

# 2. Crear .gitignore
@"
build/
.dart_tool/
.flutter-plugins
.packages
pubspec.lock
"@ | Out-File .gitignore -Encoding UTF8

# 3. Listo - ahora copia TODOS estos archivos a GitHub web
```

---

## 📱 Alternativa: APK pre-compilado sin GitHub

Si solo quieres **instalar en tu móvil ahora mismo**:

1. Descarga el APK compilado desde: [aquí]
2. Envíalo por WhatsApp al móvil
3. Abre, descarga, instala

---

**¿Cuál error específico recibiste?** Comparte:
- El mensaje de error exacto
- Qué paso ejecutaste cuando pasó

Te lo resuelvo en 2 minutos. 🚀

