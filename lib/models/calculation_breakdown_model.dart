import 'package:equatable/equatable.dart';

/// Modelo para resultado de cálculo
class CalculationBreakdown extends Equatable {
  final String operationType;
  final String immobileType;
  final double baseAmount;
  final double itpRate;
  final double itpAmount;
  
  // IRPF Real
  final double originalPrice;
  final double ipcPurchase;
  final double ipcSale;
  final double updatedCost;
  final double realGain;
  final double irpfRealRate;
  final double irpfRealAmount;
  
  // IRPF Ficto
  final double irpfFictRate;
  final double irpfFictAmount;
  
  final String selectedRegimen; // 'real' | 'ficto'
  final double totalTaxes;
  final DateTime calculatedAt;

  const CalculationBreakdown({
    required this.operationType,
    required this.immobileType,
    required this.baseAmount,
    required this.itpRate,
    required this.itpAmount,
    required this.originalPrice,
    required this.ipcPurchase,
    required this.ipcSale,
    required this.updatedCost,
    required this.realGain,
    required this.irpfRealRate,
    required this.irpfRealAmount,
    required this.irpfFictRate,
    required this.irpfFictAmount,
    required this.selectedRegimen,
    required this.totalTaxes,
    required this.calculatedAt,
  });

  /// Retorna el IRPF aplicado (menor entre real y ficto)
  double get appliedIrpf => irpfRealAmount < irpfFictAmount 
      ? irpfRealAmount 
      : irpfFictAmount;

  /// Retorna el porcentaje de IRPF aplicado
  double get appliedIrpfRate => irpfRealAmount < irpfFictAmount 
      ? irpfRealRate 
      : irpfFictRate;

  CalculationBreakdown copyWith({
    String? operationType,
    String? immobileType,
    double? baseAmount,
    double? itpRate,
    double? itpAmount,
    double? originalPrice,
    double? ipcPurchase,
    double? ipcSale,
    double? updatedCost,
    double? realGain,
    double? irpfRealRate,
    double? irpfRealAmount,
    double? irpfFictRate,
    double? irpfFictAmount,
    String? selectedRegimen,
    double? totalTaxes,
    DateTime? calculatedAt,
  }) {
    return CalculationBreakdown(
      operationType: operationType ?? this.operationType,
      immobileType: immobileType ?? this.immobileType,
      baseAmount: baseAmount ?? this.baseAmount,
      itpRate: itpRate ?? this.itpRate,
      itpAmount: itpAmount ?? this.itpAmount,
      originalPrice: originalPrice ?? this.originalPrice,
      ipcPurchase: ipcPurchase ?? this.ipcPurchase,
      ipcSale: ipcSale ?? this.ipcSale,
      updatedCost: updatedCost ?? this.updatedCost,
      realGain: realGain ?? this.realGain,
      irpfRealRate: irpfRealRate ?? this.irpfRealRate,
      irpfRealAmount: irpfRealAmount ?? this.irpfRealAmount,
      irpfFictRate: irpfFictRate ?? this.irpfFictRate,
      irpfFictAmount: irpfFictAmount ?? this.irpfFictAmount,
      selectedRegimen: selectedRegimen ?? this.selectedRegimen,
      totalTaxes: totalTaxes ?? this.totalTaxes,
      calculatedAt: calculatedAt ?? this.calculatedAt,
    );
  }

  @override
  List<Object?> get props => [
    operationType,
    immobileType,
    baseAmount,
    itpRate,
    itpAmount,
    originalPrice,
    ipcPurchase,
    ipcSale,
    updatedCost,
    realGain,
    irpfRealRate,
    irpfRealAmount,
    irpfFictRate,
    irpfFictAmount,
    selectedRegimen,
    totalTaxes,
    calculatedAt,
  ];
}
