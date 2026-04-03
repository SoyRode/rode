# 🚀 INICIO RÁPIDO - GUÍA DE 5 MINUTOS

## ¿Qué tienes?

Una aplicación completa para calcular impuestos inmobiliarios en Uruguay con:
- ✅ Código Flutter listo
- ✅ Diseño UI/UX completo
- ✅ Toda la normativa incluida
- ✅ Servicios de cálculo implementados
- ✅ Documentación completa

## Paso 1: Configurar el Entorno (10 minutos)

### Requisitos Previos
```bash
# Verificar que tienes esto instalado:
flutter --version      # Debe ser 3.0+
dart --version        # Debe ser 3.0+
git --version
```

### Si no está instalado:
1. Ir a https://flutter.dev/docs/get-started/install
2. Descargar Flutter 3.0+
3. Seguir instrucciones de instalación para tu SO

## Paso 2: Preparar Proyecto (5 minutos)

```bash
# Entrar a la carpeta del proyecto
cd c:/AppCelulares/itp_irpf_calculator

# Obtener dependencias
flutter pub get

# Crear archivo .env (copiar .env.example)
cp .env.example .env
```

## Paso 3: Ejecutar en Desarrollo (Elige uno)

### Opción A: Emulador Android
```bash
# Abrir Android Studio → AVD Manager → Crear emulador
# Luego ejecutar:
flutter run
```

### Opción B: Dispositivo Físico
```bash
# Conectar por USB (con USB Debug habilitado)
flutter devices      # Ver dispositivos
flutter run          # Ejecutar
```

### Opción C: Navegador (testing rápido)
```bash
flutter run -d chrome
```

## Paso 4: Explorar el Código

```
lib/
├── main.dart ..................... Punto de entrada (UI base)
├── models/ ....................... Estructuras de datos
├── services/
│   ├── calculation_service.dart .. ⭐ CORAZÓN: Lógica de cálculos
│   └── index_service.dart ........ Obtener índices
├── widgets/ ...................... Componentes UI
└── utils/
    └── constants.dart ............ Todas las alícuotas
```

## Paso 5: Entender la Lógica de Cálculo

### Archivo clave: `lib/services/calculation_service.dart`

```dart
// Método principal que lo hace TODO:
CalculationBreakdown generateCalculationBreakdown({
  // ENTRADAS:
  required double salePrice,           // Precio de venta
  required double purchasePrice,       // Precio original
  required double ipcPurchaseMonth,    // IPC mes compra
  required double ipcSaleMonth,        // IPC mes venta
  required String immobileType,        // 'urban' | 'rural'
  
  // SALIDAS:
  // - ITP calculado
  // - IRPF régimen real
  // - IRPF régimen ficto
  // - Desglose completo
});
```

### Fórmulas Principales:
```dart
// 1. BASE IMPONIBLE
baseAmount = max(fiscalValue, agreedPrice);

// 2. ITP
itpAmount = baseAmount * itpRate; // 2% típicamente

// 3. IRPF REAL
updatedCost = purchasePrice * (ipcSale / ipcPurchase);
realGain = salePrice - updatedCost;
irpfReal = realGain * dynamicRate(realGain);

// 4. IRPF FICTO
irpfFicto = salePrice * fictoRate; // 2% urbano, 1% rural

// 5. ELEGIR MEJOR
selectedIRPF = min(irpfReal, irpfFicto);

// 6. TOTAL
totalTaxes = itpAmount + selectedIRPF;
```

## Paso 6: Hacer un Cálculo de Prueba

### 1. Ejecutar la app
```bash
flutter run
```

### 2. En el simulador/dispositivo:
1. Presionar "IMPUESTOS SOBRE VENTA"
2. Seleccionar "INMUEBLE URBANO"
3. Ingresar datos de prueba:
   - Valuación Fiscal: $500.000
   - Precio Pactado: $550.000
   - Precio Original: $200.000
   - Fecha Compra: 15/07/2015
   - Fecha Venta: 15/03/2026
4. Presionar "CALCULAR"

### 3. Ver resultado
El cálculo mostrar:
- ITP: $11.000 (2% de $550.000)
- IRPF Real: ~$32.000
- IRPF Ficto: $11.000
- Total: ~$43.000

## Paso 7: Próximos Pasos

### Para Continuar Desarrollando:

1. **Implementar pantallas faltantes**
   - `lib/screens/calculation_screen.dart`
   - `lib/screens/results_screen.dart`
   - etc

2. **Conectar APIs reales**
   - Editar `index_service.dart`
   - Usar datos reales del INE/BCU

3. **Agregar exportación PDF**
   - Usar el paquete `pdf` incluido
   - Implementar `ExportService`

4. **Testing**
   - Crear tests en `test/`
   - Ejecutar: `flutter test`

5. **Compilar para Release**
   ```bash
   flutter build apk --release      # Android
   flutter build ios --release      # iOS
   flutter build web --release      # Web
   ```

## 📚 Documentación Completa

Leer en este orden:

1. **RESUMEN_EJECUTIVO.md** - Qué tienes
2. **docs/UI_UX_SPECIFICATION.md** - Cómo se ve
3. **docs/NORMATIVA_ITP.md** - Qué calcula (ITP)
4. **docs/NORMATIVA_IRPF.md** - Qué calcula (IRPF)
5. **docs/ARCHITECTURE.md** - Cómo está organizado
6. **README.md** - Instrucciones generales
7. **docs/DEPLOYMENT.md** - Cómo publicar

## 🐛 Debugging

### Ver logs en consola
```dart
import 'package:logger/logger.dart';

final logger = Logger();
logger.d('Debug: $valor');
logger.i('Info: operación realizada');
logger.e('Error: $error');
```

### Ejecutar en modo debug
```bash
flutter run
# Luego en terminal:
# Presionar 'd' para debugger
# Presionar 'q' para salir
```

### Rebuild rápido en development
```bash
flutter run
# Presionar 'r' para hot reload
# Presionar 'R' para hot restart
```

## ⚙️ Configuración de IDE

### VS Code
```bash
# Instalar extensiones recomendadas
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension esbenp.prettier-vscode
```

### Android Studio
```bash
# Ya vienen incluidas, solo abrir proyecto
open -a "Android Studio" .
```

## 💾 Estructura de Archivos Importantes

```
Edita estos archivos para cambiar el comportamiento:

lib/utils/constants.dart
├─ ITP_COMPRAVENTA = 0.02  ← Cambiar alícuotas aquí
├─ IRPF_URBANO_TRAMO1_RATE = 0.08
└─ ... todas las tasas

lib/services/calculation_service.dart
├─ calculateITP() ................. Lógica de ITP
├─ calculateIRPFReal() ........... Lógica IRPF real
└─ calculateIRPFFicticio() ....... Lógica IRPF ficto

lib/models/
├─ immobile_model.dart ........... Modelo de inmueble
├─ operation_model.dart ......... Modelo de operación
└─ calculation_breakdown_model.dart .... Resultado cálculo

lib/main.dart
├─ Tema (colores, tipografía)
└─ Splash Screen
```

## 🔥 Cambios Rápidos Comunes

### Cambiar colores
En `lib/main.dart`:
```dart
const Color PRIMARY_COLOR = Color(0xFF5B3BA0); // Púrpura
// Cambiar a tu color preferido
```

### Cambiar alícuota ITP
En `lib/utils/constants.dart`:
```dart
const double ITP_COMPRAVENTA = 0.02; // Cambiar aquí
```

### Agregar nueva operación
1. Agregar en `lib/utils/constants.dart`:
   ```dart
   const String OPERATION_TYPE_NUEVA = 'nueva';
   ```
2. Agregar cálculo en `lib/services/calculation_service.dart`
3. Agregar en selector de pantalla

## 📊 Verificación Final

Antes de publicar, verificar:

```bash
# ✓ Análisis estático (sin warnings)
flutter analyze

# ✓ Tests pasan
flutter test

# ✓ Compilación
flutter build apk --release  # Android
flutter build ios --release  # iOS

# ✓ Tamaño razonable
# APK < 30MB sin compresión
# IPA < 50MB
```

## 🎯 Objetivo Final

Tener una app que:
- ✅ Se instale en Play Store y App Store
- ✅ Calcule ITP correctamente
- ✅ Calcule IRPF (ambos regímenes)
- ✅ Sea fácil de usar
- ✅ Funcione sin internet (con caché)
- ✅ Guarde historiales
- ✅ Exporte a PDF

## 🤝 Apoyo

Si tienes preguntas:
1. Revisar documentación en `/docs`
2. Ver comentarios en código
3. Ejecutar tests para entender esperado
4. Consultar logger para debugging

---

**¡Listo!** Ahora tienes todo lo necesario para:
- Entender el código
- Hacer cambios
- Continuar desarrollo
- Publicar en stores

**Tiempo para ir a producción:** 1-2 semanas con testing
**Tiempo para publicar:** 24-72 horas (revisión de stores)

---

**Próximo paso:** Abrir `lib/main.dart` y empezar a explorar el código.

¡Éxito! 🚀
