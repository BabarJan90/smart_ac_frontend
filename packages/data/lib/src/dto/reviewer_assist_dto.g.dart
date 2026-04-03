// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewer_assist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewerAssistDto _$ReviewerAssistDtoFromJson(Map<String, dynamic> json) =>
    ReviewerAssistDto(
      summary: json['summary'] as String,
      keyConcerns: (json['key_concerns'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recommendedActions: (json['recommended_actions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      riskLevel: json['risk_level'] as String,
      agent: json['agent'] as String,
      stats: ReviewerStatsDto.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewerAssistDtoToJson(ReviewerAssistDto instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'key_concerns': instance.keyConcerns,
      'recommended_actions': instance.recommendedActions,
      'risk_level': instance.riskLevel,
      'agent': instance.agent,
      'stats': instance.stats,
    };

ReviewerStatsDto _$ReviewerStatsDtoFromJson(Map<String, dynamic> json) =>
    ReviewerStatsDto(
      totalTransactions: (json['total_transactions'] as num).toInt(),
      totalValue: (json['total_value'] as num).toDouble(),
      highRiskCount: (json['high_risk_count'] as num).toInt(),
      anomalyCount: (json['anomaly_count'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewerStatsDtoToJson(ReviewerStatsDto instance) =>
    <String, dynamic>{
      'total_transactions': instance.totalTransactions,
      'total_value': instance.totalValue,
      'high_risk_count': instance.highRiskCount,
      'anomaly_count': instance.anomalyCount,
    };
