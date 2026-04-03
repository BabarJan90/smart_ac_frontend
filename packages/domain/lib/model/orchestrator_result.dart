import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'junior_assist.dart';
import 'reviewer_assist.dart';
import 'anomaly_report.dart';
import 'client_letter.dart';

@injectable
class OrchestratorResult extends Equatable {
  final String orchestrator;
  final String completedAt;
  final double durationSeconds;
  final String summary;
  final OrchestratorAccountState accountState;
  final List<OrchestratorPlanStep> planExecuted;
  final List<OrchestratorActionLog> actionLog;
  final OrchestratorResults results;

  const OrchestratorResult({
    required this.orchestrator,
    required this.completedAt,
    required this.durationSeconds,
    required this.summary,
    required this.accountState,
    required this.planExecuted,
    required this.actionLog,
    required this.results,
  });

  @override
  List<Object?> get props => [
    orchestrator,
    completedAt,
    durationSeconds,
    summary,
    accountState,
    planExecuted,
    actionLog,
    results,
  ];
}

@injectable
class OrchestratorAccountState extends Equatable {
  final int totalTransactions;
  final double totalValue;
  final int highRiskCount;
  final int anomalyCount;

  const OrchestratorAccountState({
    required this.totalTransactions,
    required this.totalValue,
    required this.highRiskCount,
    required this.anomalyCount,
  });

  @override
  List<Object?> get props => [
    totalTransactions,
    totalValue,
    highRiskCount,
    anomalyCount,
  ];
}

@injectable
class OrchestratorPlanStep extends Equatable {
  final String agent;
  final String reason;
  final int priority;

  const OrchestratorPlanStep({
    required this.agent,
    required this.reason,
    required this.priority,
  });

  @override
  List<Object?> get props => [
    agent,
    reason,
    priority,
  ];
}

@injectable
class OrchestratorActionLog extends Equatable {
  final String timestamp;
  final String action;
  final String detail;

  const OrchestratorActionLog({
    required this.timestamp,
    required this.action,
    required this.detail,
  });

  @override
  List<Object?> get props => [
    timestamp,
    action,
    detail,
  ];
}

@injectable
class OrchestratorResults extends Equatable {
  final JuniorAssistResult juniorAssist;
  final ReviewerAssist reviewerAssist;
  final AnomalyReport anomalyReport;
  final ClientLetter clientLetter;

  const OrchestratorResults({
    required this.juniorAssist,
    required this.reviewerAssist,
    required this.anomalyReport,
    required this.clientLetter,
  });

  @override
  List<Object?> get props => [
    juniorAssist,
    reviewerAssist,
    anomalyReport,
    clientLetter,
  ];
}
