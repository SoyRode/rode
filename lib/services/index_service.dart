import 'package:dio/dio.dart';
import 'package:itp_irpf_calculator/models/index_model.dart';
import 'package:logger/logger.dart';

/// Servicio para obtener índices macroeconómicos de fuentes oficiales uruguayas
class IndexService {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  // URLs de APIs oficiales
  static const String INE_IPC_URL = 'https://www.ine.gub.uy/documents/';
  static const String BCU_UI_URL = 'https://www.bcu.gub.uy/';
  static const String BCU_EXCHANGE_URL = 'https://www.bcu.gub.uy/';

  /// Obtiene el IPC (Índice de Precios al Consumidor) del INE
  /// Retorna el valor del IPC para un mes específico
  Future<EconomicIndex?> getIPCForMonth({
    required int year,
    required int month,
  }) async {
    try {
      _logger.i('Obteniendo IPC - Año: $year, Mes: $month');

      // NOTA: En producción, esto se conectaría directamente con la API del INE
      // Por ahora retornamos valores de ejemplo que serían reemplazados por datos reales
      
      // Simulación de datos - En producción usar: http://www.ine.gub.uy/wps/...
      final ipcValue = _getMockIPCValue(year, month);
      
      return EconomicIndex(
        name: 'IPC',
        value: ipcValue,
        date: DateTime(year, month),
        lastUpdated: DateTime.now(),
        source: 'INE',
      );
    } catch (e) {
      _logger.e('Error obteniendo IPC: $e');
      return null;
    }
  }

  /// Obtiene el UI (Índice de Unidad Reajustable) del BCU
  /// El UI se actualiza diariamente
  Future<EconomicIndex?> getUIForDate({
    required DateTime date,
  }) async {
    try {
      _logger.i('Obteniendo UI para: $date');

      // En producción: https://www.bcu.gub.uy/calculadora-de-ajuste-de-deuda
      final uiValue = _getMockUIValue(date);
      
      return EconomicIndex(
        name: 'UI',
        value: uiValue,
        date: date,
        lastUpdated: DateTime.now(),
        source: 'BCU',
      );
    } catch (e) {
      _logger.e('Error obteniendo UI: $e');
      return null;
    }
  }

  /// Obtiene el UR (Unidad Reajustable) del MVOTMA
  Future<EconomicIndex?> getURForMonth({
    required int year,
    required int month,
  }) async {
    try {
      _logger.i('Obteniendo UR - Año: $year, Mes: $month');

      final urValue = _getMockURValue(year, month);
      
      return EconomicIndex(
        name: 'UR',
        value: urValue,
        date: DateTime(year, month),
        lastUpdated: DateTime.now(),
        source: 'MVOTMA',
      );
    } catch (e) {
      _logger.e('Error obteniendo UR: $e');
      return null;
    }
  }

  /// Obtiene la cotización del dólar (Banco Comprador - BCU)
  Future<ExchangeRate?> getUSDExchangeRate() async {
    try {
      _logger.i('Obteniendo cotización USD');

      // En producción: https://www.bcu.gub.uy/
      // Buscar API oficial de cotización diaria
      
      final buyRate = _getMockUSDRate(); // Valor simulado
      
      return ExchangeRate(
        currency: 'USD',
        buyRate: buyRate,
        sellRate: buyRate + 0.50, // Aproximadamente
        date: DateTime.now(),
        lastUpdated: DateTime.now(),
        source: 'BCU',
      );
    } catch (e) {
      _logger.e('Error obteniendo cotización USD: $e');
      return null;
    }
  }

  /// Actualiza todos los índices disponibles
  Future<Map<String, EconomicIndex?>> updateAllIndexes() async {
    _logger.i('Actualizando todos los índices');

    final now = DateTime.now();
    final indices = <String, EconomicIndex?>{};

    // Obtener IPC actual
    indices['IPC'] = await getIPCForMonth(
      year: now.year,
      month: now.month,
    );

    // Obtener UI
    indices['UI'] = await getUIForDate(date: now);

    // Obtener UR
    indices['UR'] = await getURForMonth(
      year: now.year,
      month: now.month,
    );

    // Obtener USD
    indices['USD'] = await getUSDExchangeRate() as EconomicIndex?;

    _logger.d('Índices actualizados: ${indices.length} items');
    return indices;
  }

  /// ==================== DATOS SIMULADOS (MOCK) ====================
  /// En producción, estos datos vendrían de las APIs oficiales
  
  /// Retorna IPC simulado para demostración
  double _getMockIPCValue(int year, int month) {
    // Valores aproximados de IPC en Uruguay (base dic 2010 = 100)
    // Estos son ejemplos - en producción serían reales del INE
    
    final mockData = {
      202201: 280.45,
      202202: 283.12,
      202203: 286.89,
      202301: 295.67,
      202302: 298.34,
      202303: 301.45,
      202601: 318.90,
      202602: 321.45,
      202603: 323.78,
      202604: 326.12,
    };

    final key = (year * 100) + month;
    return mockData[key] ?? 320.45;
  }

  /// Retorna UI simulado para demostración
  double _getMockUIValue(DateTime date) {
    // UI aproximado en Uruguay (valores mensuales aproximados)
    final mockUI = 1254.89 * (1 + (date.month - 3) * 0.01);
    return mockUI;
  }

  /// Retorna UR simulado para demostración
  double _getMockURValue(int year, int month) {
    // UR aproximado (valores mensuales)
    final mockUR = 1800.00 + (month * 2.5);
    return mockUR;
  }

  /// Retorna cotización USD simulada para demostración
  double _getMockUSDRate() {
    // Aproximadamente USD/UYU (banco comprador)
    // En abril 2026 sería aproximadamente 36-37
    return 36.50;
  }

  /// Obtiene la URL específica para descargar datos del INE
  String getINEDataUrl({required int year, required int month}) {
    // URL del INE para IPC mensual
    return 'https://www.ine.gub.uy/wps/portal/estadísticas/ipc';
  }

  /// Obtiene la URL para cotización oficial del BCU
  String getBCUExchangeRateUrl() {
    return 'https://www.bcu.gub.uy/Cotizaciones';
  }
}
