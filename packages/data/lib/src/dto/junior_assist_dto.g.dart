// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'junior_assist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JuniorAssistResultDto _$JuniorAssistResultDtoFromJson(
  Map<String, dynamic> json,
) => JuniorAssistResultDto(
  status: json['status'] as String,
  processed: (json['processed'] as num).toInt(),
  categorisations: (json['categorisations'] as List<dynamic>)
      .map((e) => CategorizationDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$JuniorAssistResultDtoToJson(
  JuniorAssistResultDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'processed': instance.processed,
  'categorisations': instance.categorisations,
};

CategorizationDto _$CategorizationDtoFromJson(Map<String, dynamic> json) =>
    CategorizationDto(
      transactionId: (json['transaction_id'] as num?)?.toInt(),
      vendor: json['vendor'] as String?,
      category: json['category'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CategorizationDtoToJson(CategorizationDto instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'vendor': instance.vendor,
      'category': instance.category,
      'confidence': instance.confidence,
      'notes': instance.notes,
    };
