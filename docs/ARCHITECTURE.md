# ARQUITECTURA TÉCNICA Y ESPECIFICACIÓN

## STACK TECNOLÓGICO

### Frontend
- **Framework:** Flutter 3.x
- **Lenguaje:** Dart 3.x
- **State Management:** Provider / Riverpod
- **Base de datos local:** Hive / SQLite
- **HTTP Client:** Dio
- **PDF Generation:** PDF Package
- **Dates:** Intl / TimeZone

### Backend (Opcional)
- **Runtime:** Node.js / Python / Dart
- **Database:** PostgreSQL / Firebase Firestore
- **API:** REST / GraphQL
- **Caching:** Redis

### Servicios Externos
- **INE API:** Para obtener IPC
- **BCU API:** Para obtener UI, UR, cotización USD
- **Cloud:** Firebase Storage (para backups)

### Desarrollo
- **Version Control:** Git
- **Build Tool:** Gradle (Android) / Xcode (iOS)
- **Testing:** Flutter Test / Integration Tests
- **CI/CD:** GitHub Actions / Firebase Deploy

---

## ESTRUCTURA DE CARPETAS

```
itp_irpf_calculator/
├── lib/
│   ├── main.dart                          # Punto de entrada
│   ├── config/
│   │   ├── app_config.dart               # Configuración global
│   │   ├── routes.dart                   # Rutas de navegación
│   │   └── theme.dart                    # Tema y estilos
│   │
│   ├── models/
│   │   ├── immobile_model.dart           # Modelo de inmueble
│   │   ├── operation_model.dart          # Modelo de operación
│   │   ├── calculation_result_model.dart # Resultado de cálculo
│   │   ├── index_model.dart              # Modelos de índices (IPC, UI, UR)
│   │   └── user_model.dart               # Modelo de usuario
│   │
│   ├── services/
│   │   ├── calculation_service.dart      # Lógica de cálculos
│   │   ├── index_service.dart            # Obtener índices (IPC, UI, UR)
│   │   ├── api_service.dart              # Llamadas a APIs externas
│   │   ├── storage_service.dart          # Almacenamiento local (Hive/SQLite)
│   │   ├── export_service.dart           # Exportar PDF/imagen
│   │   └── notification_service.dart     # Notificaciones
│   │
│   ├── providers/
│   │   ├── calculation_provider.dart     # Provider para cálculos
│   │   ├── index_provider.dart           # Provider para índices
│   │   ├── operation_provider.dart       # Provider para operaciones
│   │   ├── storage_provider.dart         # Provider para almacenamiento
│   │   └── app_state_provider.dart       # Estado global de la app
│   │
│   ├── screens/
│   │   ├── splash_screen.dart            # Pantalla de inicio
│   │   ├── home_screen.dart              # Menú principal
│   │   ├── immobile_type_screen.dart     # Selector urbano/rural
│   │   ├── calculation_screen.dart       # Formulario de entrada
│   │   ├── results_screen.dart           # Resultados
│   │   ├── history_screen.dart           # Historial
│   │   ├── settings_screen.dart          # Configuración
│   │   ├── operation_types_screen.dart   # Selector de tipo operación
│   │   └── detail_screen.dart            # Detalles de operación
│   │
│   ├── widgets/
│   │   ├── common/
│   │   │   ├── custom_app_bar.dart       # AppBar personalizado
│   │   │   ├── custom_button.dart        # Botón personalizado
│   │   │   ├── custom_input_field.dart   # Campo de entrada
│   │   │   ├── custom_card.dart          # Tarjeta
│   │   │   ├── info_tooltip.dart         # Tooltip informativo
│   │   │   └── custom_date_picker.dart   # Selector de fecha
│   │   │
│   │   ├── calculation/
│   │   │   ├── calculation_form.dart     # Formulario de cálculo
│   │   │   ├── result_card.dart          # Tarjeta de resultado
│   │   │   ├── calculation_breakdown.dart# Desglose de cálculo
│   │   │   └── comparison_view.dart      # Comparación régimen real/ficto
│   │   │
│   │   └── history/
│   │       ├── history_list_item.dart    # Item del historial
│   │       └── empty_history_view.dart   # Vista vacía
│   │
│   ├── utils/
│   │   ├── constants.dart                # Constantes (alícuotas, etc)
│   │   ├── validators.dart               # Validadores de campos
│   │   ├── formatters.dart               # Formateadores de números/fechas
│   │   ├── currency_helper.dart          # Utilidades de moneda
│   │   ├── date_helper.dart              # Utilidades de fechas
│   │   └── logger.dart                   # Sistema de logging
│   │
│   └── error_handling/
│       ├── custom_exceptions.dart        # Excepciones personalizadas
│       └── error_handler.dart            # Manejador de errores
│
├── assets/
│   ├── images/
│   │   ├── logo.png
│   │   ├── icons/
│   │   │   ├── immobile_urban.png
│   │   │   ├── immobile_rural.png
│   │   │   ├── calculation_icon.png
│   │   │   └── ... más iconos
│   │   └── illustrations/
│   │       ├── empty_history.png
│   │       └── success_illustration.png
│   │
│   └── fonts/
│       ├── Inter/
│       └── Roboto/
│
├── docs/
│   ├── NORMATIVA_ITP.md                 # Documentación ITP
│   ├── NORMATIVA_IRPF.md                # Documentación IRPF
│   ├── UI_UX_SPECIFICATION.md           # Especificación UI/UX
│   ├── ARCHITECTURE.md                  # Este archivo
│   ├── API_INTEGRATION.md               # Guía de integración APIs
│   ├── DEPLOYMENT.md                    # Guía de despliegue
│   └── README.md                        # Readme principal
│
├── test/
│   ├── unit/
│   │   ├── calculation_service_test.dart
│   │   ├── index_service_test.dart
│   │   └── validators_test.dart
│   │
│   ├── widget/
│   │   ├── custom_button_test.dart
│   │   └── custom_input_field_test.dart
│   │
│   └── integration/
│       └── app_flow_test.dart
│
├── pubspec.yaml                         # Dependencias
├── pubspec.lock
├── analysis_options.yaml                # Análisis estático
└── .env.example                         # Ejemplo de variables de entorno
```

---

## MODELOS DE DATOS

### Immobile Model
```dart
class Immobile {
  final String id;
  final String type; // 'urban' | 'rural'
  final double fiscalValue;
  final double agreedPrice;
  final DateTime createdAt;
}
```

### Operation Model
```dart
class Operation {
  final String id;
  final String type; // 'compraventa' | 'herencia' | 'donacion' | 'permuta' | 'cesion'
  final Immobile immobile;
  final double originalPrice;
  final DateTime purchaseDate;
  final DateTime saleDate;
  final CalculationResult result;
  final DateTime createdAt;
  final bool isFavorite;
}
```

### Calculation Result Model
```dart
class CalculationResult {
  final double baseAmount;
  final double itpAmount;
  final double irpfRealAmount;
  final double irpfFictAmount;
  final double totalTaxes;
  final String selectedRegimen; // 'real' | 'ficto'
  final CalculationBreakdown breakdown;
  final DateTime calculatedAt;
}
```

### Index Model
```dart
class EconomicIndex {
  final String name; // 'IPC' | 'UI' | 'UR'
  final double value;
  final DateTime date;
  final DateTime lastUpdated;
  final String source; // 'INE' | 'BCU' | 'MVOTMA'
}
```

---

## SERVICIOS PRINCIPALES

### Calculation Service
**Responsabilidad:** Realizar todos los cálculos fiscales

**Métodos:**
- `calculateITP()` - Calcula impuesto de transmisiones
- `calculateIRPFReal()` - Calcula incremento patrimonial régimen real
- `calculateIRPFFicticio()` - Calcula incremento patrimonial régimen ficto
- `selectBestRegimen()` - Elige régimen más favorable
- `updateWithIndexes()` - Actualiza cálculos con nuevos índices

### Index Service
**Responsabilidad:** Obtener y cachear índices macroeconómicos

**Métodos:**
- `getIPC(DateTime)` - Obtiene IPC para fecha específica
- `getUI(DateTime)` - Obtiene UI
- `getUR(DateTime)` - Obtiene UR
- `getDollarRate()` - Obtiene cotización USD
- `updateAllIndexes()` - Actualiza todos los índices
- `getCachedIndex()` - Obtiene índice en caché
- `isIndexOutdated()` - Verifica si índice está desactualizado

### API Service
**Responsabilidad:** Comunicación con APIs externas

**Métodos:**
- `fetchIPCFromINE()` - Obtiene IPC del INE
- `fetchUIFromBCU()` - Obtiene UI del BCU
- `fetchURFromMVOTMA()` - Obtiene UR del MVOTMA
- `fetchExchangeRate()` - Obtiene cotización USD
- `sendOperationToServer()` - Sincroniza operación al servidor

### Storage Service
**Responsabilidad:** Persistencia local de datos

**Métodos:**
- `saveOperation()` - Guarda operación en base de datos
- `getOperation()` - Obtiene operación por ID
- `getAllOperations()` - Obtiene todas las operaciones
- `deleteOperation()` - Elimina operación
- `updateOperation()` - Actualiza operación
- `exportOperations()` - Exporta todas las operaciones

### Export Service
**Responsabilidad:** Generar archivos de exportación

**Métodos:**
- `generatePDF()` - Genera PDF del resultado
- `generateImage()` - Genera imagen del resultado
- `shareOperation()` - Comparte resultado

---

## STATE MANAGEMENT (PROVIDER / RIVERPOD)

### Providers

```dart
// Index Providers
final ipcProvider = FutureProvider<double>((ref) async {
  return await ref.read(indexService).getIPC(DateTime.now());
});

// Calculation Providers
final calculationProvider = StateNotifierProvider<CalculationNotifier, CalculationResult>((ref) {
  return CalculationNotifier();
});

// Storage Providers
final operationsProvider = StateNotifierProvider<OperationsNotifier, List<Operation>>((ref) {
  return OperationsNotifier();
});

// App State
final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});
```

---

## ALMACENAMIENTO LOCAL

### Hive Boxes
```dart
// Operaciones guardadas
HiveBox<Operation> operationsBox;

// Índices en caché
HiveBox<EconomicIndex> indexesBox;

// Preferencias de usuario
HiveBox<UserPreferences> preferencesBox;
```

---

## VALIDACIONES

- **Números:** Solo dígitos positivos, máximo 2 decimales
- **Fechas:** Compra debe ser anterior a venta
- **Campos requeridos:** Todos los campos con * son obligatorios
- **Rango de fechas:** No permitir fechas futuras en venta
- **Valores mínimos:** No permitir $0 en valores monetarios

---

## CONECTIVIDAD

- **Modo online:** Actualiza índices automáticamente
- **Modo offline:** Usa caché local y permite cálculos
- **Sincronización:** Al recuperar conexión, sincroniza datos

---

## SEGURIDAD

- **Variables de entorno:** Almacenar API keys en .env
- **Encriptación:** Hive encriptado para datos sensibles
- **HTTPS:** Solo comunicación segura con servidores
- **Input Validation:** Validar todos los inputs del usuario

---

## TESTING

### Unit Tests
- Pruebas de cálculos fiscales
- Pruebas de validadores
- Pruebas de formateo

### Widget Tests
- Pruebas de componentes UI
- Pruebas de interacción

### Integration Tests
- Flujo completo de cálculo
- Guardado y recuperación de operaciones

---

## PERFORMANCE

- **Lazy Loading:** Cargar índices bajo demanda
- **Caché:** Almacenar índices por 7 días
- **Optimización de builds:** ProGuard para Android
- **Tamaño APK:** < 30MB (sin compresión)

---

## MANTENIMIENTO Y ESCALABILIDAD

### Estructura modular
- Cada servicio es independiente
- Fácil agregar nuevos tipos de operaciones
- Fácil integrar nuevas APIs

### Futuras expansiones
- Agregar cálculo de otros impuestos (IVA, etc)
- Integrar autenticación de usuario
- Sincronización en cloud
- Soporte para múltiples países

