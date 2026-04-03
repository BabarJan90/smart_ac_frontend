import 'package:json_annotation/json_annotation.dart';

part 'audit_entry_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuditEntryDto {
  final int id;
  final String timestamp;
  final String action;
  final int? transactionId;
  final String? modelUsed;
  final String? justification;

  const AuditEntryDto({
    required this.id,
    required this.timestamp,
    required this.action,
    this.transactionId,
    this.modelUsed,
    this.justification,
  });

  factory AuditEntryDto.fromJson(Map<String, dynamic> json) =>
      _$AuditEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuditEntryDtoToJson(this);
}
