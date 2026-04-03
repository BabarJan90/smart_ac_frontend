import 'package:json_annotation/json_annotation.dart';

part 'reviewer_assist_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReviewerAssistDto {
  final String summary;
  final List<String> keyConcerns;
  final List<String> recommendedActions;
  final String riskLevel;
  final String agent;
  final ReviewerStatsDto stats;

  const ReviewerAssistDto({
    required this.summary,
    required this.keyConcerns,
    required this.recommendedActions,
    required this.riskLevel,
    required this.agent,
    required this.stats,
  });

  factory ReviewerAssistDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewerAssistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewerAssistDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ReviewerStatsDto {
  final int totalTransactions;
  final double totalValue;
  final int highRiskCount;
  final int anomalyCount;

  const ReviewerStatsDto({
    required this.totalTransactions,
    required this.totalValue,
    required this.highRiskCount,
    required this.anomalyCount,
  });

  factory ReviewerStatsDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewerStatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewerStatsDtoToJson(this);
}
