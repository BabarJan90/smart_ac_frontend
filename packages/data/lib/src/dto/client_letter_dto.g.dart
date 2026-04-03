// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_letter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientLetterResultDto _$ClientLetterResultDtoFromJson(
  Map<String, dynamic> json,
) => ClientLetterResultDto(
  status: json['status'] as String,
  client: json['client'] as String?,
  letter: json['letter'] as String?,
);

Map<String, dynamic> _$ClientLetterResultDtoToJson(
  ClientLetterResultDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'client': instance.client,
  'letter': instance.letter,
};
