import 'package:itp_irpf_calculator/models/immobile_model.dart';
import 'package:itp_irpf_calculator/models/calculation_breakdown_model.dart';
import 'package:itp_irpf_calculator/utils/constants.dart';
import 'package:logger/logger.dart';

/// Servicio principal para realizar cálculos de impuestos
class CalculationService {
  final Logger _logger = Logger();

  /// Calcula el ITP según el tipo de operación
  /// 
  /// [baseAmount]: Base imponible
  /// [operationType]: Tipo de operación (compraventa, herencia, etc)
  /// [isFirsHome]: Si es primera vivienda (para compraventa)
  double calculateITP({
    required double baseAmount,
    required String operationType,
    bool isFirsHome = false,
  }) {
    _logger.i('Calculando ITP - Base: $baseAmount, Tipo: $operationType');

    double rate = 0.0;

    switch (operationType) {
      case OPERATION_TYPE_COMPRAVENTA:
        rate = isFirsHome ? ITP_PRIMERA_VIVIENDA : ITP_COMPRAVENTA;
        break;
      case OPERATION_TYPE_HERENCIA:
        rate = ITP_SUCESION_EXENTA; // Por defecto exento (cónyuge e hijos)
        break;
      case OPERATION_TYPE_PERMUTA:
        rate = ITP_PERMUTA;
        break;
      case OPERATION_TYPE_CESION:
        rate = ITP_CESION_DERECHOS;
        break;
      case OPERATION_TYPE_DONACION:
        rate = ITP_DONACION_PADRES_HIJOS; // Por defecto
        break;
      default:
        rate = ITP_COMPRAVENTA;
    }

    final result = baseAmount * rate;
    _logger.d('ITP Calculado: $result (Tasa: $rate)');
    
    return _roundCurrency(result);
  }

  /// Calcula el IRPF bajo el régimen REAL (ganancia real)
  /// 
  /// [salePrice]: Precio de venta
  /// [purchasePrice]: Precio de compra original
  /// [ipcPurchaseMonth]: IPC del mes de compra
  /// [ipcSaleMonth]: IPC del mes de venta
  /// [immobileType]: Tipo de inmueble (urbano/rural)
  double calculateIRPFReal({
    required double salePrice,
    required double purchasePrice,
    required double ipcPurchaseMonth,
    required double ipcSaleMonth,
    required String immobileType,
  }) {
    _logger.i('Calculando IRPF REAL');
    _logger.d('Venta: $salePrice, Compra: $purchasePrice');
    _logger.d('IPC Compra: $ipcPurchaseMonth, IPC Venta: $ipcSaleMonth');

    // Paso 1: Calcular costo actualizado
    final updatedCost = (purchasePrice * ipcSaleMonth) / ipcPurchaseMonth;
    _logger.d('Costo Actualizado: $updatedCost');

    // Paso 2: Calcular ganancia real
    final realGain = salePrice - updatedCost;
    _logger.d('Ganancia Real: $realGain');

    // Paso 3: Aplicar escala según tipo de inmueble
    double rate = _getIRPFRate(realGain, immobileType);
    _logger.d('Tasa IRPF aplicada: $rate');

    // Paso 4: Calcular impuesto
    final irpfReal = realGain > 0 ? realGain * rate : 0.0;
    _logger.d('IRPF Real: $irpfReal');

    return _roundCurrency(irpfReal);
  }

  /// Calcula el IRPF bajo el régimen FICTO (simplificado)
  /// 
  /// [salePrice]: Precio de venta
  /// [immobileType]: Tipo de inmueble (urbano/rural)
  double calculateIRPFFicticio({
    required double salePrice,
    required String immobileType,
  }) {
    _logger.i('Calculando IRPF FICTO');
    _logger.d('Venta: $salePrice, Tipo: $immobileType');

    final double rate = immobileType == IMMOBILE_TYPE_URBAN 
        ? IRPF_URBANO_FICTO_RATE 
        : IRPF_RURAL_FICTO_RATE;

    final irpfFicto = salePrice * rate;
    _logger.d('IRPF Ficto: $irpfFicto (Tasa: $rate)');

    return _roundCurrency(irpfFicto);
  }

  /// Obtiene la tasa de IRPF según el tramo de ganancia
  /// 
  /// Formula escalonada según normativa vigente 2026
  double _getIRPFRate(double gain, String immobileType) {
    if (immobileType == IMMOBILE_TYPE_URBAN) {
      return _getUrbanIRPFRate(gain);
    } else {
      return _getRuralIRPFRate(gain);
    }
  }

  /// Calcula tasa de IRPF para inmuebles URBANOS
  /// Escala progresiva con exención inicial
  double _getUrbanIRPFRate(double gain) {
    if (gain <= IRPF_URBANO_EXEMPT_LIMIT) {
      return 0.0; // Exento hasta $100.000
    } else if (gain <= IRPF_URBANO_TRAMO1_LIMIT) {
      return IRPF_URBANO_TRAMO1_RATE; // 8% hasta $200.000
    } else if (gain <= IRPF_URBANO_TRAMO2_LIMIT) {
      return IRPF_URBANO_TRAMO2_RATE; // 12% hasta $400.000
    } else if (gain <= IRPF_URBANO_TRAMO3_LIMIT) {
      return IRPF_URBANO_TRAMO3_RATE; // 14% hasta $600.000
    } else if (gain <= IRPF_URBANO_TRAMO4_LIMIT) {
      return IRPF_URBANO_TRAMO4_RATE; // 16% hasta $800.000
    } else {
      return IRPF_URBANO_TRAMO5_RATE; // 18% superior a $800.000
    }
  }

  /// Calcula tasa de IRPF para inmuebles RURALES
  /// Escala progresiva con exención inicial
  double _getRuralIRPFRate(double gain) {
    if (gain <= IRPF_RURAL_EXEMPT_LIMIT) {
      return 0.0; // Exento hasta $150.000
    } else if (gain <= IRPF_RURAL_TRAMO1_LIMIT) {
      return IRPF_RURAL_TRAMO1_RATE; // 8% hasta $300.000
    } else if (gain <= IRPF_RURAL_TRAMO2_LIMIT) {
      return IRPF_RURAL_TRAMO2_RATE; // 12% hasta $500.000
    } else {
      return IRPF_RURAL_TRAMO3_RATE; // 15% superior a $500.000
    }
  }

  /// Genera desglose completo de cálculo
  CalculationBreakdown generateCalculationBreakdown({
    required String operationType,
    required String immobileType,
    required double baseAmount,
    required double originalPrice,
    required double salePrice,
    required DateTime purchaseDate,
    required DateTime saleDate,
    required double ipcPurchase,
    required double ipcSale,
  }) {
    _logger.i('Generando desglose de cálculo');

    // Calcular ITP
    final itpRate = _getITPRate(operationType);
    final itpAmount = baseAmount * itpRate;

    // Calcular IRPF
    final updatedCost = (originalPrice * ipcSale) / ipcPurchase;
    final realGain = salePrice - updatedCost;
    final irpfRealRate = _getIRPFRate(realGain, immobileType);
    final irpfRealAmount = realGain > 0 ? realGain * irpfRealRate : 0.0;

    // IRPF Ficto
    final irpfFictRate = immobileType == IMMOBILE_TYPE_URBAN 
        ? IRPF_URBANO_FICTO_RATE 
        : IRPF_RURAL_FICTO_RATE;
    final irpfFictAmount = salePrice * irpfFictRate;

    // Seleccionar mejor régimen
    final selectedRegimen = irpfRealAmount < irpfFictAmount 
        ? REGIMEN_REAL 
        : REGIMEN_FICTO;
    
    final totalIRPF = irpfRealAmount < irpfFictAmount 
        ? irpfRealAmount 
        : irpfFictAmount;

    final totalTaxes = _roundCurrency(itpAmount + totalIRPF);

    _logger.d('Desglose: ITP=$itpAmount, IRPF Real=$irpfRealAmount, IRPF Ficto=$irpfFictAmount, Total=$totalTaxes');

    return CalculationBreakdown(
      operationType: operationType,
      immobileType: immobileType,
      baseAmount: _roundCurrency(baseAmount),
      itpRate: itpRate,
      itpAmount: _roundCurrency(itpAmount),
      originalPrice: originalPrice,
      ipcPurchase: ipcPurchase,
      ipcSale: ipcSale,
      updatedCost: _roundCurrency(updatedCost),
      realGain: _roundCurrency(realGain),
      irpfRealRate: irpfRealRate,
      irpfRealAmount: _roundCurrency(irpfRealAmount),
      irpfFictRate: irpfFictRate,
      irpfFictAmount: _roundCurrency(irpfFictAmount),
      selectedRegimen: selectedRegimen,
      totalTaxes: totalTaxes,
      calculatedAt: DateTime.now(),
    );
  }

  /// Obtiene la tasa de ITP según el tipo de operación
  double _getITPRate(String operationType) {
    switch (operationType) {
      case OPERATION_TYPE_COMPRAVENTA:
        return ITP_COMPRAVENTA;
      case OPERATION_TYPE_HERENCIA:
        return ITP_SUCESION_EXENTA;
      case OPERATION_TYPE_PERMUTA:
        return ITP_PERMUTA;
      case OPERATION_TYPE_CESION:
        return ITP_CESION_DERECHOS;
      case OPERATION_TYPE_DONACION:
        return ITP_DONACION_PADRES_HIJOS;
      default:
        return ITP_COMPRAVENTA;
    }
  }

  /// Redondea a 2 decimales (moneda)
  double _roundCurrency(double value) {
    return (value * 100).round() / 100;
  }

  /// Valida que los datos sean correctos antes de calcular
  bool validateCalculationData({
    required double baseAmount,
    required double originalPrice,
    required double salePrice,
    required double ipcPurchase,
    required double ipcSale,
  }) {
    if (baseAmount <= 0) {
      _logger.w('Base imponible inválida: $baseAmount');
      return false;
    }
    if (originalPrice <= 0) {
      _logger.w('Precio original inválido: $originalPrice');
      return false;
    }
    if (salePrice <= 0) {
      _logger.w('Precio de venta inválido: $salePrice');
      return false;
    }
    if (ipcPurchase <= 0 || ipcSale <= 0) {
      _logger.w('IPC inválido');
      return false;
    }
    return true;
  }
}
