import 'package:itp_irpf_calculator/models/immobile_model.dart';
import 'package:itp_irpf_calculator/services/calculation_service.dart';
import 'package:itp_irpf_calculator/utils/constants.dart';
import 'package:uuid/uuid.dart';

/// EJEMPLO DE USO - Cómo usar CalculationService
/// 
/// Este archivo muestra ejemplos prácticos de cómo
/// hacer cálculos de ITP e IRPF usando la aplicación

void main() {
  // Crear instancia del servicio
  final calculationService = CalculationService();

  // Ejemplo 1: Compraventa de inmueble urbano
  print('════════════════════════════════════════');
  print('EJEMPLO 1: COMPRAVENTA INMUEBLE URBANO');
  print('════════════════════════════════════════\n');

  final urbanoBreakdown = calculationService.generateCalculationBreakdown(
    operationType: OPERATION_TYPE_COMPRAVENTA,
    immobileType: IMMOBILE_TYPE_URBAN,
    baseAmount: 550000.0,           // Base imponible
    originalPrice: 200000.0,        // Precio original (compra anterior)
    salePrice: 550000.0,            // Precio actual de venta
    purchaseDate: DateTime(2015, 7, 15),
    saleDate: DateTime(2026, 3, 15),
    ipcPurchase: 230.67,            // IPC julio 2015
    ipcSale: 323.78,                // IPC marzo 2026
  );

  print('RESULTADO - Inmueble Urbano:');
  print('─────────────────────────────');
  print('Base Imponible: \$${urbanoBreakdown.baseAmount.toStringAsFixed(2)}');
  print('ITP (2%): \$${urbanoBreakdown.itpAmount.toStringAsFixed(2)}');
  print('');
  print('Costo Actualizado: \$${urbanoBreakdown.updatedCost.toStringAsFixed(2)}');
  print('Ganancia Real: \$${urbanoBreakdown.realGain.toStringAsFixed(2)}');
  print('IRPF Real (${(urbanoBreakdown.irpfRealRate * 100).toStringAsFixed(1)}%): \$${urbanoBreakdown.irpfRealAmount.toStringAsFixed(2)}');
  print('IRPF Ficto (2%): \$${urbanoBreakdown.irpfFictAmount.toStringAsFixed(2)}');
  print('');
  print('✓ Se aplica RÉGIMEN: ${urbanoBreakdown.selectedRegimen.toUpperCase()}');
  print('');
  print('TOTAL IMPUESTOS: \$${urbanoBreakdown.totalTaxes.toStringAsFixed(2)}');
  print('');

  // Ejemplo 2: Compraventa de inmueble rural
  print('════════════════════════════════════════');
  print('EJEMPLO 2: COMPRAVENTA INMUEBLE RURAL');
  print('════════════════════════════════════════\n');

  final ruralBreakdown = calculationService.generateCalculationBreakdown(
    operationType: OPERATION_TYPE_COMPRAVENTA,
    immobileType: IMMOBILE_TYPE_RURAL,
    baseAmount: 750000.0,
    originalPrice: 600000.0,
    salePrice: 750000.0,
    purchaseDate: DateTime(2020, 1, 15),
    saleDate: DateTime(2026, 3, 15),
    ipcPurchase: 298.15,            // IPC enero 2020
    ipcSale: 323.78,                // IPC marzo 2026
  );

  print('RESULTADO - Inmueble Rural:');
  print('─────────────────────────────');
  print('Base Imponible: \$${ruralBreakdown.baseAmount.toStringAsFixed(2)}');
  print('ITP (2%): \$${ruralBreakdown.itpAmount.toStringAsFixed(2)}');
  print('');
  print('Costo Actualizado: \$${ruralBreakdown.updatedCost.toStringAsFixed(2)}');
  print('Ganancia Real: \$${ruralBreakdown.realGain.toStringAsFixed(2)}');
  print('IRPF Real (${(ruralBreakdown.irpfRealRate * 100).toStringAsFixed(1)}%): \$${ruralBreakdown.irpfRealAmount.toStringAsFixed(2)}');
  print('IRPF Ficto (1%): \$${ruralBreakdown.irpfFictAmount.toStringAsFixed(2)}');
  print('');
  print('✓ Se aplica RÉGIMEN: ${ruralBreakdown.selectedRegimen.toUpperCase()}');
  print('');
  print('TOTAL IMPUESTOS: \$${ruralBreakdown.totalTaxes.toStringAsFixed(2)}');
  print('');

  // Ejemplo 3: Cálculos individuales de ITP
  print('════════════════════════════════════════');
  print('EJEMPLO 3: CÁLCULOS INDIVIDUALES');
  print('════════════════════════════════════════\n');

  final itpCompraventa = calculationService.calculateITP(
    baseAmount: 500000.0,
    operationType: OPERATION_TYPE_COMPRAVENTA,
    isFirsHome: false,
  );

  print('ITP - Compraventa normal:');
  print('Base: \$500.000');
  print('Alícuota: 2%');
  print('ITP: \$${itpCompraventa.toStringAsFixed(2)}');
  print('');

  final itpPrimeraVivienda = calculationService.calculateITP(
    baseAmount: 500000.0,
    operationType: OPERATION_TYPE_COMPRAVENTA,
    isFirsHome: true,
  );

  print('ITP - Primera vivienda:');
  print('Base: \$500.000');
  print('Alícuota: 0.5%');
  print('ITP: \$${itpPrimeraVivienda.toStringAsFixed(2)}');
  print('');

  // Ejemplo 4: Cálculos individuales de IRPF
  print('════════════════════════════════════════');
  print('EJEMPLO 4: CÁLCULOS IRPF INDIVIDUAL');
  print('════════════════════════════════════════\n');

  const double precioCompra = 200000.0;
  const double precioVenta = 550000.0;
  const double ipcCompra = 230.67;
  const double ipcVenta = 323.78;

  final irpfReal = calculationService.calculateIRPFReal(
    salePrice: precioVenta,
    purchasePrice: precioCompra,
    ipcPurchaseMonth: ipcCompra,
    ipcSaleMonth: ipcVenta,
    immobileType: IMMOBILE_TYPE_URBAN,
  );

  final irpfFicto = calculationService.calculateIRPFFicticio(
    salePrice: precioVenta,
    immobileType: IMMOBILE_TYPE_URBAN,
  );

  print('IRPF - Inmueble Urbano:');
  print('Precio Venta: \$${precioVenta.toStringAsFixed(2)}');
  print('Precio Compra: \$${precioCompra.toStringAsFixed(2)}');
  print('IPC Compra: $ipcCompra | IPC Venta: $ipcVenta');
  print('');
  print('Régimen Real: \$${irpfReal.toStringAsFixed(2)}');
  print('Régimen Ficto: \$${irpfFicto.toStringAsFixed(2)}');
  print('SE APLICA: \$${(irpfReal < irpfFicto ? irpfReal : irpfFicto).toStringAsFixed(2)} (el menor)');
  print('');

  // Ejemplo 5: Validación de datos antes de calcular
  print('════════════════════════════════════════');
  print('EJEMPLO 5: VALIDACIÓN DE DATOS');
  print('════════════════════════════════════════\n');

  final datosValidos = calculationService.validateCalculationData(
    baseAmount: 500000.0,
    originalPrice: 200000.0,
    salePrice: 500000.0,
    ipcPurchase: 230.67,
    ipcSale: 323.78,
  );

  print('Validación de datos correctos: $datosValidos');

  final datosInvalidos = calculationService.validateCalculationData(
    baseAmount: -500000.0,  // Inválido
    originalPrice: 200000.0,
    salePrice: 500000.0,
    ipcPurchase: 230.67,
    ipcSale: 323.78,
  );

  print('Validación de datos con monto negativo: $datosInvalidos');
  print('');

  // Ejemplo 6: Información útil para mostrar en UI
  print('════════════════════════════════════════');
  print('INFORMACIÓN PARA LA UI');
  print('════════════════════════════════════════\n');

  print('Desglose completo del cálculo anterior (Urbano):');
  print('');
  print('Operación: ${urbanoBreakdown.operationType}');
  print('Tipo Inmueble: ${urbanoBreakdown.immobileType}');
  print('Base Imponible: \$${urbanoBreakdown.baseAmount.toStringAsFixed(2)}');
  print('');
  print('ITP:');
  print('  Tasa: ${(urbanoBreakdown.itpRate * 100).toStringAsFixed(1)}%');
  print('  Monto: \$${urbanoBreakdown.itpAmount.toStringAsFixed(2)}');
  print('');
  print('IRPF (Régimen REAL):');
  print('  Costo Original: \$${urbanoBreakdown.originalPrice.toStringAsFixed(2)}');
  print('  IPC Compra: ${urbanoBreakdown.ipcPurchase}');
  print('  IPC Venta: ${urbanoBreakdown.ipcSale}');
  print('  Costo Actualizado: \$${urbanoBreakdown.updatedCost.toStringAsFixed(2)}');
  print('  Ganancia: \$${urbanoBreakdown.realGain.toStringAsFixed(2)}');
  print('  Tasa: ${(urbanoBreakdown.irpfRealRate * 100).toStringAsFixed(1)}%');
  print('  Monto: \$${urbanoBreakdown.irpfRealAmount.toStringAsFixed(2)}');
  print('');
  print('IRPF (Régimen FICTO):');
  print('  Tasa: ${(urbanoBreakdown.irpfFictRate * 100).toStringAsFixed(1)}%');
  print('  Monto: \$${urbanoBreakdown.irpfFictAmount.toStringAsFixed(2)}');
  print('');
  print('═══════════════════════════════════════');
  print('TOTAL IMPUESTOS A PAGAR: \$${urbanoBreakdown.totalTaxes.toStringAsFixed(2)}');
  print('═══════════════════════════════════════');
}

/// CÓMO USAR ESTO EN LA APP:
/// 
/// 1. En CalculationScreen, cuando el usuario presiona "CALCULAR":
/// 
///    final service = CalculationService();
///    final result = service.generateCalculationBreakdown(
///      operationType: selectedType,
///      immobileType: selectedImmobileType,
///      baseAmount: max(fiscalValue, agreedPrice),
///      originalPrice: textController1.value,
///      salePrice: textController2.value,
///      purchaseDate: selectedPurchaseDate,
///      saleDate: selectedSaleDate,
///      ipcPurchase: indexService.getIPCForDate(selectedPurchaseDate),
///      ipcSale: indexService.getIPCForDate(selectedSaleDate),
///    );
/// 
/// 2. Guardar en almacenamiento:
///    
///    final operation = Operation(
///      id: const Uuid().v4(),
///      type: selectedType,
///      immobile: immobile,
///      originalPrice: originalPrice,
///      purchaseDate: purchaseDate,
///      saleDate: saleDate,
///      breakdown: result,
///      createdAt: DateTime.now(),
///    );
///    
///    await storageService.saveOperation(operation);
/// 
/// 3. Mostrar resultados en ResultsScreen:
///    
///    ResultCard(
///      title: 'ITP',
///      value: '\$${result.itpAmount.toStringAsFixed(2)}',
///      description: 'Impuesto a las Transmisiones',
///      color: Colors.blue,
///    ),
///    // ... más cards para IRPF
///
