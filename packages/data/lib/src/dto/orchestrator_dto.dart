import 'package:json_annotation/json_annotation.dart';
import 'reviewer_assist_dto.dart';
import 'junior_assist_dto.dart';
import 'anomaly_report_dto.dart';
import 'client_letter_dto.dart';

part 'orchestrator_dto.g.dart';

// ── Orchestrator Request ──────────────────────────────────────────────────────

@JsonSerializable(fieldRename: FieldRename.snake)
class OrchestratorRequestDto {
  final String? clientName;

  const OrchestratorRequestDto({this.clientName});

  factory OrchestratorRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OrchestratorRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrchestratorRequestDtoToJson(this);
}

// ── Orchestrator Result ───────────────────────────────────────────────────────

@JsonSerializable(fieldRename: FieldRename.snake)
class OrchestratorResultDto {
  final String orchestrator;
  final String completedAt;
  final double durationSeconds;
  final String summary;
  final OrchestratorAccountStateDto accountState;
  final List<OrchestratorPlanStepDto> planExecuted;
  final List<OrchestratorActionLogDto> actionLog;
  final OrchestratorResultsDto results;

  const OrchestratorResultDto({
    required this.orchestrator,
    required this.completedAt,
    required this.durationSeconds,
    required this.summary,
    required this.accountState,
    required this.planExecuted,
    required this.actionLog,
    required this.results,
  });

  factory OrchestratorResultDto.fromJson(Map<String, dynamic> json) =>
      _$OrchestratorResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrchestratorResultDtoToJson(this);
}

// ── Account State ─────────────────────────────────────────────────────────────

@JsonSerializable(fieldRename: FieldRename.snake)
class OrchestratorAccountStateDto {
  final int totalTransactions;
  final double totalValue;
  final int highRiskCount;
  final int anomalyCount;

  const OrchestratorAccountStateDto({
    required this.totalTransactions,
    required this.totalValue,
    required this.highRiskCount,
    required this.anomalyCount,
  });

  factory OrchestratorAccountStateDto.fromJson(Map<String, dynamic> json) =>
      _$OrchestratorAccountStateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrchestratorAccountStateDtoToJson(this);
}

// ── Plan Step ─────────────────────────────────────────────────────────────────

@JsonSerializable(fieldRename: FieldRename.snake)
class OrchestratorPlanStepDto {
  final String agent;
  final String reason;
  final int priority;

  const OrchestratorPlanStepDto({
    required this.agent,
    required this.reason,
    required this.priority,
  });

  factory OrchestratorPlanStepDto.fromJson(Map<String, dynamic> json) =>
      _$OrchestratorPlanStepDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrchestratorPlanStepDtoToJson(this);
}

// ── Action Log Entry ──────────────────────────────────────────────────────────

@JsonSerializable(fieldRename: FieldRename.snake)
class OrchestratorActionLogDto {
  final String timestamp;
  final String action;
  final String detail;

  const OrchestratorActionLogDto({
    required this.timestamp,
    required this.action,
    required this.detail,
  });

  factory OrchestratorActionLogDto.fromJson(Map<String, dynamic> json) =>
      _$OrchestratorActionLogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrchestratorActionLogDtoToJson(this);
}

// ── Results Container ─────────────────────────────────────────────────────────

@JsonSerializable(fieldRename: FieldRename.snake)
class OrchestratorResultsDto {
  final JuniorAssistResultDto? juniorAssist;
  final ReviewerAssistDto? reviewerAssist;
  final AnomalyReportResultDto? anomalyReport;
  final ClientLetterResultDto? clientLetter;

  const OrchestratorResultsDto({
    this.juniorAssist,
    this.reviewerAssist,
    this.anomalyReport,
    this.clientLetter,
  });

  factory OrchestratorResultsDto.fromJson(Map<String, dynamic> json) =>
      _$OrchestratorResultsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrchestratorResultsDtoToJson(this);
}
