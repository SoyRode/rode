import 'package:equatable/equatable.dart';

/// Modelo para representar un inmueble
class Immobile extends Equatable {
  final String id;
  final String type; // 'urban' | 'rural'
  final double fiscalValue;
  final double agreedPrice;
  final DateTime createdAt;

  const Immobile({
    required this.id,
    required this.type,
    required this.fiscalValue,
    required this.agreedPrice,
    required this.createdAt,
  });

  /// Retorna la base imponible (mayor entre valuación fiscal y precio pactado)
  double get taxableBase => agreedPrice > fiscalValue ? agreedPrice : fiscalValue;

  /// Copia con cambios
  Immobile copyWith({
    String? id,
    String? type,
    double? fiscalValue,
    double? agreedPrice,
    DateTime? createdAt,
  }) {
    return Immobile(
      id: id ?? this.id,
      type: type ?? this.type,
      fiscalValue: fiscalValue ?? this.fiscalValue,
      agreedPrice: agreedPrice ?? this.agreedPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, type, fiscalValue, agreedPrice, createdAt];
}
