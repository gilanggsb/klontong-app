import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../lib.dart';

// Required for the generated code
part 'pagination_params.freezed.dart';
part 'pagination_params.g.dart'; // For json_serializable

// Helper functions for easy conversion
PaginationParams paginationParamsFromJson(String str) =>
    PaginationParams.fromJson(json.decode(str));

String paginationParamsToJson(PaginationParams data) =>
    json.encode(data.toJson());

@customFreezed
abstract class PaginationParams with _$PaginationParams {
  @customJsonSerializable
  const factory PaginationParams({int? limit, int? offset, String? searchKey}) =
      _PaginationParams;

  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);
}
