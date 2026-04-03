import 'package:json_annotation/json_annotation.dart';

part 'transaction_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionDto {
  final int id;
  final String date;
  final String vendor;
  final double amount;
  final String? category;
  final String? description;
  final double? riskScore;
  final String? riskLabel;
  final bool isAnomaly;
  final String? explanation;

  const TransactionDto({
    required this.id,
    required this.date,
    required this.vendor,
    required this.amount,
    this.category,
    this.description,
    this.riskScore,
    this.riskLabel,
    required this.isAnomaly,
    this.explanation,
  });

  factory TransactionDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);
}
