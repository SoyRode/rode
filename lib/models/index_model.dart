import 'package:equatable/equatable.dart';

/// Modelo para índices macroeconómicos (IPC, UI, UR)
class EconomicIndex extends Equatable {
  final String name; // 'IPC' | 'UI' | 'UR'
  final double value;
  final DateTime date;
  final DateTime lastUpdated;
  final String source; // 'INE' | 'BCU' | 'MVOTMA'

  const EconomicIndex({
    required this.name,
    required this.value,
    required this.date,
    required this.lastUpdated,
    required this.source,
  });

  /// Verifica si el índice está desactualizado (> 7 días)
  bool get isOutdated {
    final now = DateTime.now();
    final difference = now.difference(lastUpdated).inDays;
    return difference > 7;
  }

  EconomicIndex copyWith({
    String? name,
    double? value,
    DateTime? date,
    DateTime? lastUpdated,
    String? source,
  }) {
    return EconomicIndex(
      name: name ?? this.name,
      value: value ?? this.value,
      date: date ?? this.date,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [name, value, date, lastUpdated, source];
}

/// Modelo para cotización de monedas extranjeras
class ExchangeRate extends Equatable {
  final String currency; // 'USD' | 'EUR' | 'BRL'
  final double buyRate;
  final double sellRate;
  final DateTime date;
  final DateTime lastUpdated;
  final String source; // 'BCU'

  const ExchangeRate({
    required this.currency,
    required this.buyRate,
    required this.sellRate,
    required this.date,
    required this.lastUpdated,
    required this.source,
  });

  /// Retorna la tasa promedio (compra + venta) / 2
  double get averageRate => (buyRate + sellRate) / 2;

  /// Verifica si la tasa está desactualizada (> 7 días)
  bool get isOutdated {
    final now = DateTime.now();
    final difference = now.difference(lastUpdated).inDays;
    return difference > 7;
  }

  ExchangeRate copyWith({
    String? currency,
    double? buyRate,
    double? sellRate,
    DateTime? date,
    DateTime? lastUpdated,
    String? source,
  }) {
    return ExchangeRate(
      currency: currency ?? this.currency,
      buyRate: buyRate ?? this.buyRate,
      sellRate: sellRate ?? this.sellRate,
      date: date ?? this.date,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [currency, buyRate, sellRate, date, lastUpdated, source];
}
