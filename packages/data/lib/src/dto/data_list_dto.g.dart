// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataListDto<T> _$DataListDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => DataListDto<T>(
  items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataListDtoToJson<T>(
  DataListDto<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': ?instance.items?.map(toJsonT).toList(),
  'currentPage': ?instance.currentPage,
  'pageSize': ?instance.pageSize,
  'totalPages': ?instance.totalPages,
};
