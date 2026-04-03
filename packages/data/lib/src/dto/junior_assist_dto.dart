import 'package:json_annotation/json_annotation.dart';

part 'junior_assist_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JuniorAssistResultDto {
  final String status;
  final int processed;
  final List<CategorizationDto> categorisations;

  const JuniorAssistResultDto({
    required this.status,
    required this.processed,
    required this.categorisations,
  });

  factory JuniorAssistResultDto.fromJson(Map<String, dynamic> json) =>
      _$JuniorAssistResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JuniorAssistResultDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CategorizationDto {
  final int? transactionId;
  final String? vendor;
  final String? category;
  final double? confidence;
  final String? notes;

  const CategorizationDto({
    this.transactionId,
    this.vendor,
    this.category,
    this.confidence,
    this.notes,
  });

  factory CategorizationDto.fromJson(Map<String, dynamic> json) =>
      _$CategorizationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategorizationDtoToJson(this);
}
