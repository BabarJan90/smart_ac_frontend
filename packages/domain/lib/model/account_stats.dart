import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountStats extends Equatable {
  final int totalTransactions;
  final double totalValue;
  final int lowRisk;
  final int mediumRisk;
  final int highRisk;
  final int unscored;
  final int anomalyCount;

  const AccountStats({
    required this.totalTransactions,
    required this.totalValue,
    required this.lowRisk,
    required this.mediumRisk,
    required this.highRisk,
    required this.unscored,
    required this.anomalyCount,
  });

  @override
  List<Object?> get props => [
    totalTransactions,
    totalValue,
    lowRisk,
    mediumRisk,
    highRisk,
    unscored,
    anomalyCount,
  ];
}
