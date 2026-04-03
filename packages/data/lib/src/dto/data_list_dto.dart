import 'package:json_annotation/json_annotation.dart';

part 'data_list_dto.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  explicitToJson: true,
  includeIfNull: false,
)
class DataListDto<T> {
  final List<T>? items;
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;

  DataListDto({
    required this.items,
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
  });

  factory DataListDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$DataListDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataListDtoToJson(this, toJsonT);
}
