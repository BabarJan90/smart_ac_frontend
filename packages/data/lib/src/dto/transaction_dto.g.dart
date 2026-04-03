// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    TransactionDto(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      vendor: json['vendor'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String?,
      description: json['description'] as String?,
      riskScore: (json['risk_score'] as num?)?.toDouble(),
      riskLabel: json['risk_label'] as String?,
      isAnomaly: json['is_anomaly'] as bool,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$TransactionDtoToJson(TransactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'vendor': instance.vendor,
      'amount': instance.amount,
      'category': instance.category,
      'description': instance.description,
      'risk_score': instance.riskScore,
      'risk_label': instance.riskLabel,
      'is_anomaly': instance.isAnomaly,
      'explanation': instance.explanation,
    };
