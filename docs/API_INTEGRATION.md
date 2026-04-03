# GUÍA DE INTEGRACIÓN DE APIs OFICIALES URUGUAYAS

## 1. IPC - Instituto Nacional de Estadística (INE)

### Obtener IPC Actual

**URL oficial:** https://www.ine.gub.uy/

**Pasos:**
1. Ir a "Estadísticas" → "Precios"
2. Buscar "Índice de Precios al Consumidor (IPC)"
3. Descargar datos mensuales en CSV/Excel

**Formato de datos:**
```
Mes,Año,IPC
Enero,2026,318.90
Febrero,2026,321.45
Marzo,2026,323.78
```

### Implementación en la App

```dart
Future<List<IPCData>> fetchIPCFromINE() async {
  // Opción 1: Scraping de la página web
  final response = await Dio().get('https://www.ine.gub.uy/...');
  
  // Opción 2: Usar feed de datos del INE
  // El INE publica datos en formato que puede ser parseado
  
  // Opción 3: Backend intermedio que obtiene y cachea datos
  final response = await _dio.get('$_backendUrl/api/ipc');
  
  return parseIPCData(response.data);
}
```

**Alternativa recomendada:** Crear un servicio backend que:
- Obtenga los datos del INE automáticamente
- Cachee los datos
- Exponga una API simple para la app

---

## 2. UI (Índice de Unidad Reajustable) - Banco Central (BCU)

### Obtener UI Diaria

**URL oficial:** https://www.bcu.gub.uy/

**Pasos:**
1. Ir a "Estadísticas" o "Tasas e Índices"
2. Buscar "UI" (Índice de Unidad Reajustable)
3. Los datos se actualizan diariamente

**Formato de datos:**
```json
{
  "date": "2026-04-02",
  "ui_value": 1254.89,
  "source": "BCU"
}
```

### Implementación

```dart
Future<UIData> fetchUIFromBCU(DateTime date) async {
  // El BCU publica calculadora en línea
  // Para automatizar, se recomienda scraping o API intermedia
  
  try {
    final response = await _dio.get(
      'https://www.bcu.gub.uy/calculadora-de-ajuste-de-deuda',
    );
    
    return parseUIFromHTML(response.data);
  } catch (e) {
    // Fallback a caché local
    return _getUIFromCache(date);
  }
}
```

---

## 3. UR (Unidad Reajustable) - MVOTMA

### Obtener UR Mensual

**URL oficial:** https://www.mvotma.gub.uy/

**Pasos:**
1. Ir a Secciones → "Vivienda"
2. Buscar "UR - Unidad Reajustable"
3. Datos mensuales

### Implementación

```dart
Future<URData> fetchURFromMVOTMA(int year, int month) async {
  try {
    final response = await _dio.get(
      'https://www.mvotma.gub.uy/webportal/...',
    );
    
    return parseURData(response.data);
  } catch (e) {
    return _getURFromCache(year, month);
  }
}
```

---

## 4. Cotización del Dólar - BCU

### Obtener USD/UYU

**URL oficial:** https://www.bcu.gub.uy/

**Pasos:**
1. Ir a "Cotizaciones"
2. Seleccionar "Monedas Extranjeras"
3. Buscar USD (Dólar Estadounidense)

**Datos disponibles:**
- Cotización Banco Comprador
- Cotización Banco Vendedor
- Promedio

### Implementación

```dart
Future<ExchangeRateData> fetchUSDRate() async {
  try {
    // BCU expone cotización en múltiples formatos
    final response = await _dio.get(
      'https://www.bcu.gub.uy/wps/wcm/connect/...',
    );
    
    return parseExchangeRate(response.data);
  } catch (e) {
    // Alternativa: usar servicio externo confiable
    return _fetchFromAlternativeSource();
  }
}
```

---

## ESTRATEGIA RECOMENDADA: BACKEND INTERMEDIO

### Por qué es necesario:

1. **Inconsistencia de APIs:** Instituciones uruguayas no tienen APIs REST estándar
2. **Cambios frecuentes:** El HTML puede cambiar, requiriendo mantenimiento
3. **Performance:** Cachear datos en backend mejora velocidad de app
4. **Seguridad:** Evitar exponer lógica de scraping en cliente

### Arquitectura propuesta:

```
┌─────────────────────────────────┐
│      APLICACIÓN FLUTTER         │
│                                 │
│  [IndexService]                 │
│  └─> GET /api/indexes           │
└────────────────┬────────────────┘
                 │
                 │ HTTP
                 │
┌────────────────▼────────────────┐
│    BACKEND (Node/Python/Dart)   │
│                                 │
│  GET /api/indexes               │
│  ├─> Fetch IPC (INE)            │
│  ├─> Fetch UI (BCU)             │
│  ├─> Fetch UR (MVOTMA)          │
│  └─> Fetch USD (BCU)            │
│                                 │
│  Cache (Redis/Memory)           │
│  └─> TTL: 24 horas             │
└────────────────┬────────────────┘
                 │
    ┌────────────┼────────────────┐
    │            │                │
    ▼            ▼                ▼
  [INE]        [BCU]          [MVOTMA]
```

### Ejemplo de Backend (Node.js con Express):

```javascript
const express = require('express');
const NodeCache = require('node-cache');
const axios = require('axios');

const app = express();
const cache = new NodeCache({ stdTTL: 86400 }); // 24h TTL

// Endpoint: GET /api/indexes
app.get('/api/indexes', async (req, res) => {
  try {
    let data = cache.get('indexes');
    
    if (!data) {
      data = {
        ipc: await fetchIPC(),
        ui: await fetchUI(),
        ur: await fetchUR(),
        usd: await fetchUSD(),
        updatedAt: new Date().toISOString(),
      };
      
      cache.set('indexes', data);
    }
    
    res.json({
      success: true,
      data,
      cacheAge: data.updatedAt,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

// Funciones para obtener datos
async function fetchIPC() {
  // Scraping o API call al INE
  // Retornar { value: 323.78, date: "2026-03-01" }
}

async function fetchUI() {
  // Obtener UI del BCU
}

async function fetchUR() {
  // Obtener UR del MVOTMA
}

async function fetchUSD() {
  // Obtener cotización USD/UYU
}
```

---

## ALTERNATIVA: USAR SERVICIOS EXTERNOS

### Opciones (con costo):

1. **Rapid API** - APIs uruguayas consolidadas
   - URL: https://rapidapi.com/
   - Ventaja: Fácil integración, mantenimiento profesional

2. **DGI Oficialmente**
   - DGI expone algunos datos en portal
   - Requiere acceso registrado

3. **World Bank APIs**
   - Datos macroeconómicos generales
   - Menos precisión para Uruguay

---

## IMPLEMENTACIÓN EN LA APP

### Servicio de Índices Mejorado:

```dart
class IndexService {
  final String backendUrl;
  late final Dio _dio;
  late final HiveLocalStorage _storage;

  IndexService({
    required this.backendUrl,
  }) {
    _dio = Dio(BaseOptions(baseUrl: backendUrl));
    _storage = HiveLocalStorage();
  }

  /// Obtiene todos los índices con caché inteligente
  Future<IndexesData> fetchAllIndexes({
    bool forceRefresh = false,
  }) async {
    // 1. Verificar caché local
    if (!forceRefresh) {
      final cached = await _storage.getIndexes();
      if (cached != null && !cached.isOutdated) {
        return cached;
      }
    }

    // 2. Intentar obtener del backend
    try {
      final response = await _dio.get('/api/indexes');
      final data = IndexesData.fromJson(response.data);
      
      // Guardar en caché local
      await _storage.saveIndexes(data);
      
      return data;
    } catch (e) {
      // 3. Fallback a caché local aunque esté desactualizado
      final cached = await _storage.getIndexes();
      if (cached != null) {
        return cached;
      }
      
      // 4. Último recurso: valores default
      return IndexesData.defaults();
    }
  }

  /// Obtiene IPC para mes específico
  Future<double> getIPCForMonth(int year, int month) async {
    final all = await fetchAllIndexes();
    return all.getIPCValue(year, month);
  }
}
```

### Manejo de Conexión en la App:

```dart
// En CalculationScreen o similar

Future<void> _calculateWithIndexes() async {
  try {
    // Verificar conexión
    final isConnected = await _checkInternetConnection();
    
    if (!isConnected) {
      _showOfflineMessage('Usando datos en caché');
    }
    
    // Obtener índices (con caché automático)
    final indexes = await _indexService.fetchAllIndexes();
    
    // Realizar cálculo
    final result = _calculationService.generateCalculationBreakdown(
      ipcPurchase: indexes.ipcForMonth(purchaseDate),
      ipcSale: indexes.ipcForMonth(saleDate),
      // ... otros parámetros
    );
    
    setState(() => _result = result);
  } catch (e) {
    _showError('Error obteniendo datos: $e');
  }
}
```

---

## ACTUALIZACIÓN DE ÍNDICES

### Estrategia:

1. **Al iniciar la app:**
   - Si caché < 24 horas, usar caché
   - Si caché > 24 horas, actualizar en background
   - Mostrar "Índices actualizados a: [fecha]"

2. **En pantalla de configuración:**
   - Botón "Actualizar ahora"
   - Mostrar estado: "Updating...", "Updated", "Error"

3. **Notificaciones (opcional):**
   - Notificar cuando nuevos índices están disponibles
   - Permitir actualización desde notificación

### Implementación:

```dart
class IndexUpdateService {
  Future<void> updateIndexesInBackground() async {
    final ioc = Get.find<IndexService>();
    
    try {
      await ioc.fetchAllIndexes(forceRefresh: true);
      
      // Guardar timestamp
      await GetStorage().write('last_index_update', DateTime.now());
      
      // Notificar éxito (opcional)
      _showNotification('Índices actualizados correctamente');
    } catch (e) {
      _logger.e('Error en actualización background: $e');
    }
  }
}
```

---

## FORMATO DE RESPUESTA DEL BACKEND

```json
{
  "success": true,
  "data": {
    "ipc": {
      "value": 323.78,
      "date": "2026-03-01",
      "source": "INE"
    },
    "ui": {
      "value": 1254.89,
      "date": "2026-04-02",
      "source": "BCU"
    },
    "ur": {
      "value": 1845.22,
      "date": "2026-04-01",
      "source": "MVOTMA"
    },
    "usd": {
      "buy": 36.50,
      "sell": 37.00,
      "date": "2026-04-02",
      "source": "BCU"
    },
    "updatedAt": "2026-04-02T14:30:00Z",
    "expiresAt": "2026-04-03T14:30:00Z"
  }
}
```

---

## REFERENCIAS Y ENLACES

- **INE:** https://www.ine.gub.uy/
- **BCU:** https://www.bcu.gub.uy/
- **MVOTMA:** https://www.mvotma.gub.uy/
- **DGI (Impuestos):** https://www.dgi.gub.uy/
- **IMAE (Índice Mensual):** https://www.bcu.gub.uy/estadísticas

