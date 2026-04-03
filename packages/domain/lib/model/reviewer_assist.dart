import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReviewerAssist extends Equatable {
  final String summary;
  final List<String> keyConcerns;
  final List<String> recommendedActions;
  final String riskLevel;
  final String agent;
  final int totalTransactions;
  final double totalValue;
  final int highRiskCount;
  final int anomalyCount;

  const ReviewerAssist({
    required this.summary,
    required this.keyConcerns,
    required this.recommendedActions,
    required this.riskLevel,
    required this.agent,
    required this.totalTransactions,
    required this.totalValue,
    required this.highRiskCount,
    required this.anomalyCount,
  });

  @override
  List<Object?> get props => [
    summary,
    keyConcerns,
    recommendedActions,
    riskLevel,
    agent,
    totalTransactions,
    totalValue,
    highRiskCount,
    anomalyCount,
  ];
}
