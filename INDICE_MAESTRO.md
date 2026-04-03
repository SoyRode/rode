# 📋 ÍNDICE MAESTRO DEL PROYECTO - ITP-IRPF CALCULATOR

## 🎯 INICIO AQUÍ

1. **[INICIO_RAPIDO.md](INICIO_RAPIDO.md)** ← Leer primero (5 min)
   - Configuración rápida
   - Ejecutar en desarrollo
   - Primeros pasos

2. **[RESUMEN_EJECUTIVO.md](RESUMEN_EJECUTIVO.md)** ← Visión general
   - Qué se entrega
   - Características principales
   - Próximos pasos

3. **[README.md](README.md)** ← Documentación general
   - Características completas
   - Estructura del proyecto
   - Instalación y setup

---

## 📚 DOCUMENTACIÓN TÉCNICA

### Para Desarrolladores

| Documento | Propósito | Tiempo |
|-----------|-----------|--------|
| **[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)** | Cómo está organizado el código | 15 min |
| **[docs/UI_UX_SPECIFICATION.md](docs/UI_UX_SPECIFICATION.md)** | Diseño de pantallas y flujo | 20 min |
| **[lib/main.dart](lib/main.dart)** | Código principal (UI base + tema) | 10 min |
| **[lib/services/calculation_service.dart](lib/services/calculation_service.dart)** | ⭐ Lógica de cálculos (IMPORTANTE) | 20 min |
| **[lib/utils/constants.dart](lib/utils/constants.dart)** | Todas las alícuotas y tasas | 10 min |

### Para Integraciones

| Documento | Propósito |
|-----------|-----------|
| **[docs/API_INTEGRATION.md](docs/API_INTEGRATION.md)** | Cómo conectar APIs (INE, BCU, MVOTMA) |
| **[docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)** | Publicar en Play Store y App Store |

### Para Entender Normativa

| Documento | Contenido | Para Quién |
|-----------|----------|-----------|
| **[docs/NORMATIVA_ITP.md](docs/NORMATIVA_ITP.md)** | Todo sobre ITP (definición, cálculo, ejemplos) | Contadores/Escribanos |
| **[docs/NORMATIVA_IRPF.md](docs/NORMATIVA_IRPF.md)** | Todo sobre IRPF (régimen real y ficto, ejemplos) | Contadores/Escribanos |

---

## 👥 GUÍAS POR ROL

### 👨‍💻 DESARROLLADOR

**Primero:**
1. INICIO_RAPIDO.md - Configurar entorno
2. RESUMEN_EJECUTIVO.md - Entender qué tienes
3. README.md - Estructura general

**Luego:**
4. docs/ARCHITECTURE.md - Arquitectura
5. lib/services/calculation_service.dart - Lógica principal
6. lib/utils/constants.dart - Alícuotas
7. lib/main.dart - UI base

**Para continuar:**
8. docs/UI_UX_SPECIFICATION.md - Diseñar pantallas
9. docs/API_INTEGRATION.md - Conectar APIs
10. docs/DEPLOYMENT.md - Publicar

### 📊 CONTADOR / ASESOR FISCAL

**Para entender los cálculos:**
1. docs/NORMATIVA_ITP.md - Qué es ITP y cómo se calcula
2. docs/NORMATIVA_IRPF.md - Qué es IRPF (real y ficto)
3. docs/GUIA_USO_USUARIO.md - Cómo usar la app

**Para explicar a clientes:**
4. docs/GUIA_USO_USUARIO.md - Manual completo
5. Ejemplos en NORMATIVA_ITP.md y NORMATIVA_IRPF.md

### 🏪 USUARIO FINAL

**Para usar la app:**
1. docs/GUIA_USO_USUARIO.md - Manual completo (paso a paso)

---

## 📁 ESTRUCTURA DE CARPETAS

```
itp_irpf_calculator/
│
├── 📄 INICIO_RAPIDO.md ................... 👈 LEER PRIMERO
├── 📄 RESUMEN_EJECUTIVO.md .............. Qué tienes
├── 📄 README.md ......................... Documentación general
├── 📄 .env.example ...................... Variables de entorno
│
├── 📂 lib/ ............................. CÓDIGO FLUTTER
│   ├── main.dart ....................... ⭐ Punto de entrada (UI base)
│   ├── models/ ......................... Estructuras de datos
│   │   ├── immobile_model.dart ........ Modelo de inmueble
│   │   ├── operation_model.dart ....... Modelo de operación
│   │   ├── calculation_breakdown_model.dart ... Resultado
│   │   └── index_model.dart .......... Índices (IPC, UI, UR)
│   ├── services/ ....................... Servicios (lógica)
│   │   ├── calculation_service.dart ... ⭐⭐⭐ CÁLCULOS ITP+IRPF
│   │   ├── index_service.dart ........ Obtener IPC, UI, UR
│   │   ├── api_service.dart ......... Llamadas HTTP
│   │   └── storage_service.dart ..... Guardar datos locales
│   ├── widgets/ ........................ Componentes UI
│   │   └── common_widgets.dart ........ Botones, campos, cards
│   ├── screens/ ........................ Pantallas (a completar)
│   │   ├── splash_screen.dart ........ Pantalla inicial
│   │   ├── home_screen.dart ......... Menú principal
│   │   └── (otros archivos a crear)
│   └── utils/ .......................... Utilidades
│       ├── constants.dart ............ 📋 Todas las alícuotas
│       ├── validators.dart ......... Validaciones
│       └── formatters.dart ......... Formateo de números
│
├── 📂 docs/ ............................ DOCUMENTACIÓN
│   ├── NORMATIVA_ITP.md ............... 📖 ITP explicado
│   ├── NORMATIVA_IRPF.md ............. 📖 IRPF explicado
│   ├── UI_UX_SPECIFICATION.md ........ 📐 Diseño de pantallas
│   ├── ARCHITECTURE.md ............... 🏗️ Arquitectura técnica
│   ├── API_INTEGRATION.md ............ 🔌 Conectar APIs
│   ├── DEPLOYMENT.md ................. 🚀 Publicar en stores
│   └── GUIA_USO_USUARIO.md ........... 👤 Manual del usuario
│
├── 📂 assets/ ......................... Imágenes e iconos
├── pubspec.yaml ...................... 📦 Dependencias
└── README.md ......................... Documentación raíz
```

---

## 🔑 ARCHIVOS CLAVE

### Para Hacer Cambios:

| Archivo | Para Cambiar | Ejemplo |
|---------|-------------|---------|
| **lib/utils/constants.dart** | Alícuotas | Cambiar ITP de 2% a 2.5% |
| **lib/services/calculation_service.dart** | Lógica de cálculo | Agregar nueva fórmula |
| **lib/main.dart** | Colores, tema | Cambiar púrpura a azul |
| **docs/NORMATIVA_*.md** | Documentación legal | Actualizar según leyes nuevas |

---

## ✅ CHECKLIST DE DESARROLLO

### Fase 1: Entender (1-2 días)
- [ ] Leer INICIO_RAPIDO.md
- [ ] Ejecutar `flutter run`
- [ ] Leer NORMATIVA_ITP.md
- [ ] Leer NORMATIVA_IRPF.md
- [ ] Explorar lib/services/calculation_service.dart
- [ ] Entender la lógica de cálculos

### Fase 2: Implementar Pantallas (1 semana)
- [ ] Implementar CalculationScreen
- [ ] Implementar ResultsScreen
- [ ] Implementar HistoryScreen
- [ ] Implementar SettingsScreen
- [ ] Conectar navegación

### Fase 3: Conectar APIs (3-5 días)
- [ ] Crear backend (Node.js)
- [ ] Integrar con INE (IPC)
- [ ] Integrar con BCU (UI, USD)
- [ ] Implementar caché
- [ ] Testing de APIs

### Fase 4: Exportación (2-3 días)
- [ ] Implementar exportación PDF
- [ ] Implementar exportación imagen
- [ ] Testing de exportación

### Fase 5: Testing (3-5 días)
- [ ] Unit tests para cálculos
- [ ] Widget tests
- [ ] Integration tests
- [ ] Testing en múltiples dispositivos

### Fase 6: Publicación (1 semana)
- [ ] Generar APK/AAB para Play Store
- [ ] Generar IPA para App Store
- [ ] Completar store listing
- [ ] Enviar para review
- [ ] Monitoreo post-lanzamiento

---

## 🎓 REFERENCIAS RÁPIDAS

### Normativa
- **ITP:** [docs/NORMATIVA_ITP.md](docs/NORMATIVA_ITP.md)
  - Alícuotas: 0.5% - 5%
  - Aplicación según tipo de operación
  
- **IRPF:** [docs/NORMATIVA_IRPF.md](docs/NORMATIVA_IRPF.md)
  - Urbano: 0% - 18% escalonado
  - Rural: 0% - 15% escalonado
  - Ficto: 2% (urbano) o 1% (rural)

### Fórmulas Principales
```
BASE = max(Valuación Fiscal, Precio Pactado)
ITP = BASE × Alícuota%

COSTO_ACT = Precio_Original × (IPC_Venta / IPC_Compra)
GANANCIA = Precio_Venta - COSTO_ACT
IRPF = GANANCIA × Alícuota%(por tramo)
IRPF_FINAL = min(IRPF_Real, IRPF_Ficto)
TOTAL = ITP + IRPF_FINAL
```

### Archivos de Configuración
- **.env.example** - Variables de entorno
- **pubspec.yaml** - Dependencias
- **lib/utils/constants.dart** - Alícuotas

---

## 🚀 COMANDOS ÚTILES

```bash
# Ejecutar
flutter run

# Ejecutar en dispositivo específico
flutter devices                    # Ver dispositivos
flutter run -d device_id          # Ejecutar en dispositivo

# Testing
flutter test                       # Ejecutar tests
flutter test --coverage           # Con cobertura

# Build
flutter build apk --release       # Android
flutter build ios --release       # iOS
flutter build appbundle --release # Android (Play Store)
flutter build web --release       # Web

# Limpiar
flutter clean                      # Limpiar build
flutter pub get                    # Descargar dependencias

# Análisis
flutter analyze                    # Análisis estático
dart format lib/                   # Formatear código
```

---

## 📞 CONTACTO Y SOPORTE

### Para Desarrollo
- Código: Revisar comentarios en archivos
- Dudas: Revisar documentación en `/docs`
- Testing: Ejecutar `flutter test`

### Para Usuarios
- Email: soporte@itpirpf.com
- Web: https://www.itpirpf.com
- Horario: Lunes-Viernes 9-17 hrs

---

## 🎯 OBJETIVO

Convertir esto en una app publicada en Play Store y App Store que:
- ✅ Calcule ITP correctamente
- ✅ Calcule IRPF en ambos regímenes
- ✅ Use datos oficiales (IPC, UI, UR)
- ✅ Sea fácil de usar
- ✅ Funcione offline
- ✅ Guarde historial
- ✅ Exporte resultados

---

## 📈 HITO DE PROGRESO

```
[████████████████████████████████████████] 100% PROYECTO BASE COMPLETADO

Entregables:
✅ Código base Flutter listo para desarrollo
✅ Toda la documentación normativa
✅ Especificación UI/UX completa
✅ Servicios de cálculo implementados
✅ Guías de publicación y despliegue
✅ Manuales de usuario y desarrollador

Próximo: Implementar pantallas y conectar APIs
Tiempo estimado: 2-3 semanas más
```

---

## 📖 CÓMO USAR ESTE ÍNDICE

1. **Si eres nuevo en el proyecto:** Empieza con INICIO_RAPIDO.md
2. **Si necesitas entender algo:** Busca en la tabla anterior
3. **Si necesitas cambiar código:** Usa la tabla "Archivos Clave"
4. **Si necesitas ayuda:** Revisa la sección correspondiente a tu rol

---

**Última actualización:** 2 de Abril, 2026  
**Versión:** 1.0.0  
**Estado:** ✅ COMPLETADO  

---

*Este proyecto está completo y listo para continuar desarrollo. La estructura está establecida, la documentación es exhaustiva, y el código base es funcional. ¡A empezar!* 🚀

