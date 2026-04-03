// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountStatsDto _$AccountStatsDtoFromJson(Map<String, dynamic> json) =>
    AccountStatsDto(
      totalTransactions: (json['total_transactions'] as num).toInt(),
      totalValue: (json['total_value'] as num).toDouble(),
      riskDistribution: RiskDistributionDto.fromJson(
        json['risk_distribution'] as Map<String, dynamic>,
      ),
      anomalyCount: (json['anomaly_count'] as num).toInt(),
    );

Map<String, dynamic> _$AccountStatsDtoToJson(AccountStatsDto instance) =>
    <String, dynamic>{
      'total_transactions': instance.totalTransactions,
      'total_value': instance.totalValue,
      'risk_distribution': instance.riskDistribution,
      'anomaly_count': instance.anomalyCount,
    };

RiskDistributionDto _$RiskDistributionDtoFromJson(Map<String, dynamic> json) =>
    RiskDistributionDto(
      low: (json['low'] as num?)?.toInt(),
      medium: (json['medium'] as num?)?.toInt(),
      high: (json['high'] as num?)?.toInt(),
      unscored: (json['unscored'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RiskDistributionDtoToJson(
  RiskDistributionDto instance,
) => <String, dynamic>{
  'low': instance.low,
  'medium': instance.medium,
  'high': instance.high,
  'unscored': instance.unscored,
};
