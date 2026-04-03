import 'package:json_annotation/json_annotation.dart';

part 'client_letter_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ClientLetterResultDto {
  final String status;
  final String? client;
  final String? letter;

  const ClientLetterResultDto({
    required this.status,
    this.client,
    this.letter,
  });

  factory ClientLetterResultDto.fromJson(Map<String, dynamic> json) =>
      _$ClientLetterResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClientLetterResultDtoToJson(this);
}
