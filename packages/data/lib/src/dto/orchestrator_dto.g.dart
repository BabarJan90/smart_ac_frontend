// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orchestrator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrchestratorRequestDto _$OrchestratorRequestDtoFromJson(
  Map<String, dynamic> json,
) => OrchestratorRequestDto(clientName: json['client_name'] as String?);

Map<String, dynamic> _$OrchestratorRequestDtoToJson(
  OrchestratorRequestDto instance,
) => <String, dynamic>{'client_name': instance.clientName};

OrchestratorResultDto _$OrchestratorResultDtoFromJson(
  Map<String, dynamic> json,
) => OrchestratorResultDto(
  orchestrator: json['orchestrator'] as String,
  completedAt: json['completed_at'] as String,
  durationSeconds: (json['duration_seconds'] as num).toDouble(),
  summary: json['summary'] as String,
  accountState: OrchestratorAccountStateDto.fromJson(
    json['account_state'] as Map<String, dynamic>,
  ),
  planExecuted: (json['plan_executed'] as List<dynamic>)
      .map((e) => OrchestratorPlanStepDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  actionLog: (json['action_log'] as List<dynamic>)
      .map((e) => OrchestratorActionLogDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  results: OrchestratorResultsDto.fromJson(
    json['results'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$OrchestratorResultDtoToJson(
  OrchestratorResultDto instance,
) => <String, dynamic>{
  'orchestrator': instance.orchestrator,
  'completed_at': instance.completedAt,
  'duration_seconds': instance.durationSeconds,
  'summary': instance.summary,
  'account_state': instance.accountState,
  'plan_executed': instance.planExecuted,
  'action_log': instance.actionLog,
  'results': instance.results,
};

OrchestratorAccountStateDto _$OrchestratorAccountStateDtoFromJson(
  Map<String, dynamic> json,
) => OrchestratorAccountStateDto(
  totalTransactions: (json['total_transactions'] as num).toInt(),
  totalValue: (json['total_value'] as num).toDouble(),
  highRiskCount: (json['high_risk_count'] as num).toInt(),
  anomalyCount: (json['anomaly_count'] as num).toInt(),
);

Map<String, dynamic> _$OrchestratorAccountStateDtoToJson(
  OrchestratorAccountStateDto instance,
) => <String, dynamic>{
  'total_transactions': instance.totalTransactions,
  'total_value': instance.totalValue,
  'high_risk_count': instance.highRiskCount,
  'anomaly_count': instance.anomalyCount,
};

OrchestratorPlanStepDto _$OrchestratorPlanStepDtoFromJson(
  Map<String, dynamic> json,
) => OrchestratorPlanStepDto(
  agent: json['agent'] as String,
  reason: json['reason'] as String,
  priority: (json['priority'] as num).toInt(),
);

Map<String, dynamic> _$OrchestratorPlanStepDtoToJson(
  OrchestratorPlanStepDto instance,
) => <String, dynamic>{
  'agent': instance.agent,
  'reason': instance.reason,
  'priority': instance.priority,
};

OrchestratorActionLogDto _$OrchestratorActionLogDtoFromJson(
  Map<String, dynamic> json,
) => OrchestratorActionLogDto(
  timestamp: json['timestamp'] as String,
  action: json['action'] as String,
  detail: json['detail'] as String,
);

Map<String, dynamic> _$OrchestratorActionLogDtoToJson(
  OrchestratorActionLogDto instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'action': instance.action,
  'detail': instance.detail,
};

OrchestratorResultsDto _$OrchestratorResultsDtoFromJson(
  Map<String, dynamic> json,
) => OrchestratorResultsDto(
  juniorAssist: json['junior_assist'] == null
      ? null
      : JuniorAssistResultDto.fromJson(
          json['junior_assist'] as Map<String, dynamic>,
        ),
  reviewerAssist: json['reviewer_assist'] == null
      ? null
      : ReviewerAssistDto.fromJson(
          json['reviewer_assist'] as Map<String, dynamic>,
        ),
  anomalyReport: json['anomaly_report'] == null
      ? null
      : AnomalyReportResultDto.fromJson(
          json['anomaly_report'] as Map<String, dynamic>,
        ),
  clientLetter: json['client_letter'] == null
      ? null
      : ClientLetterResultDto.fromJson(
          json['client_letter'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrchestratorResultsDtoToJson(
  OrchestratorResultsDto instance,
) => <String, dynamic>{
  'junior_assist': instance.juniorAssist,
  'reviewer_assist': instance.reviewerAssist,
  'anomaly_report': instance.anomalyReport,
  'client_letter': instance.clientLetter,
};
