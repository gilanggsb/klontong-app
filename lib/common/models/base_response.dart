import 'package:freezed_annotation/freezed_annotation.dart';

import '../common.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
abstract class BaseResponse<T> with _$BaseResponse<T> {
  @JsonSerializable(genericArgumentFactories: true)
  const factory BaseResponse({String? message, T? data, int? code}) =
      _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    FromJsonT<T> fromJsonT,
  ) {
    return _$BaseResponseFromJson<T>(json, fromJsonT);
  }
}
