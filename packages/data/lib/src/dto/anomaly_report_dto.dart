import 'package:json_annotation/json_annotation.dart';

part 'anomaly_report_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnomalyReportResultDto {
  final String status;
  final String? report;

  const AnomalyReportResultDto({
    required this.status,
    this.report,
  });

  factory AnomalyReportResultDto.fromJson(Map<String, dynamic> json) =>
      _$AnomalyReportResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnomalyReportResultDtoToJson(this);
}
