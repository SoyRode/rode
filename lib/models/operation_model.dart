import 'package:equatable/equatable.dart';
import 'immobile_model.dart';
import 'calculation_breakdown_model.dart';

/// Modelo para una operación (compraventa, herencia, etc)
class Operation extends Equatable {
  final String id;
  final String type; // 'compraventa' | 'herencia' | 'donacion' | 'permuta' | 'cesion'
  final Immobile immobile;
  final double originalPrice;
  final DateTime purchaseDate;
  final DateTime saleDate;
  final CalculationBreakdown breakdown;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isFavorite;

  const Operation({
    required this.id,
    required this.type,
    required this.immobile,
    required this.originalPrice,
    required this.purchaseDate,
    required this.saleDate,
    required this.breakdown,
    required this.createdAt,
    this.updatedAt,
    this.isFavorite = false,
  });

  /// Descripción legible del tipo de operación
  String get typeDescription {
    switch (type) {
      case 'compraventa':
        return 'Compraventa';
      case 'herencia':
        return 'Herencia';
      case 'donacion':
        return 'Donación';
      case 'permuta':
        return 'Permuta';
      case 'cesion':
        return 'Cesión de derechos';
      default:
        return 'Operación';
    }
  }

  /// Descripción legible del tipo de inmueble
  String get immobileTypeDescription {
    return immobile.type == 'urban' ? 'Inmueble Urbano' : 'Inmueble Rural';
  }

  Operation copyWith({
    String? id,
    String? type,
    Immobile? immobile,
    double? originalPrice,
    DateTime? purchaseDate,
    DateTime? saleDate,
    CalculationBreakdown? breakdown,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavorite,
  }) {
    return Operation(
      id: id ?? this.id,
      type: type ?? this.type,
      immobile: immobile ?? this.immobile,
      originalPrice: originalPrice ?? this.originalPrice,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      saleDate: saleDate ?? this.saleDate,
      breakdown: breakdown ?? this.breakdown,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    type,
    immobile,
    originalPrice,
    purchaseDate,
    saleDate,
    breakdown,
    createdAt,
    updatedAt,
    isFavorite,
  ];
}
