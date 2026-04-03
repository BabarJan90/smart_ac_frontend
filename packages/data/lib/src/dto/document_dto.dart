import 'package:json_annotation/json_annotation.dart';

part 'document_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DocumentDto {
  final int id;
  final String docType;
  final String createdAt;
  final String? preview;
  final String? content;

  const DocumentDto({
    required this.id,
    required this.docType,
    required this.createdAt,
    this.preview,
    this.content,
  });

  String get displayType {
    switch (docType) {
      case 'client_letter':  return 'Client Letter';
      case 'anomaly_report': return 'Anomaly Report';
      default: return docType.replaceAll('_', ' ').toUpperCase();
    }
  }

  factory DocumentDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentDtoToJson(this);
}
