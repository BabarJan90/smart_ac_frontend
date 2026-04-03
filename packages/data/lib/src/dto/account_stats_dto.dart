import 'package:json_annotation/json_annotation.dart';

part 'account_stats_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccountStatsDto {
  final int totalTransactions;
  final double totalValue;
  final RiskDistributionDto riskDistribution;
  final int anomalyCount;

  const AccountStatsDto({
    required this.totalTransactions,
    required this.totalValue,
    required this.riskDistribution,
    required this.anomalyCount,
  });

  factory AccountStatsDto.fromJson(Map<String, dynamic> json) =>
      _$AccountStatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountStatsDtoToJson(this);
}

@JsonSerializable()
class RiskDistributionDto {
  final int? low;
  final int? medium;
  final int? high;
  final int? unscored;

  const RiskDistributionDto({
    this.low,
    this.medium,
    this.high,
    this.unscored,
  });

  factory RiskDistributionDto.fromJson(Map<String, dynamic> json) =>
      _$RiskDistributionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RiskDistributionDtoToJson(this);
}
