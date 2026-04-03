// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentDto _$DocumentDtoFromJson(Map<String, dynamic> json) => DocumentDto(
  id: (json['id'] as num).toInt(),
  docType: json['doc_type'] as String,
  createdAt: json['created_at'] as String,
  preview: json['preview'] as String?,
  content: json['content'] as String?,
);

Map<String, dynamic> _$DocumentDtoToJson(DocumentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doc_type': instance.docType,
      'created_at': instance.createdAt,
      'preview': instance.preview,
      'content': instance.content,
    };
