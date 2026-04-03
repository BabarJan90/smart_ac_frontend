// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditEntryDto _$AuditEntryDtoFromJson(Map<String, dynamic> json) =>
    AuditEntryDto(
      id: (json['id'] as num).toInt(),
      timestamp: json['timestamp'] as String,
      action: json['action'] as String,
      transactionId: (json['transaction_id'] as num?)?.toInt(),
      modelUsed: json['model_used'] as String?,
      justification: json['justification'] as String?,
    );

Map<String, dynamic> _$AuditEntryDtoToJson(AuditEntryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'action': instance.action,
      'transaction_id': instance.transactionId,
      'model_used': instance.modelUsed,
      'justification': instance.justification,
    };
