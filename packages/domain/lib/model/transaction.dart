import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class Transaction extends Equatable {
  final int id;
  final String date;
  final String vendor;
  final double amount;
  final String category;
  final String description;
  final double riskScore;
  final String riskLabel;
  final bool isAnomaly;
  final String explanation;

  const Transaction({
    required this.id,
    required this.date,
    required this.vendor,
    required this.amount,
    required this.category,
    required this.description,
    required this.riskScore,
    required this.riskLabel,
    required this.isAnomaly,
    required this.explanation,
  });

  @override
  List<Object?> get props => [
    id,
    date,
    vendor,
    amount,
    category,
    description,
    riskScore,
    riskLabel,
    isAnomaly,
    explanation,
  ];
}
