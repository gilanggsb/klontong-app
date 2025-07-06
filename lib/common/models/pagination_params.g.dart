// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) =>
    _PaginationParams(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      searchKey: json['search_key'] as String?,
    );

Map<String, dynamic> _$PaginationParamsToJson(_PaginationParams instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'search_key': instance.searchKey,
    };
