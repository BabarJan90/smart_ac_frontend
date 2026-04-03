// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anomaly_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnomalyReportResultDto _$AnomalyReportResultDtoFromJson(
  Map<String, dynamic> json,
) => AnomalyReportResultDto(
  status: json['status'] as String,
  report: json['report'] as String?,
);

Map<String, dynamic> _$AnomalyReportResultDtoToJson(
  AnomalyReportResultDto instance,
) => <String, dynamic>{'status': instance.status, 'report': instance.report};
