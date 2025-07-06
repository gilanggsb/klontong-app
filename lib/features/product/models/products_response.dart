import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../lib.dart';

part 'products_response.freezed.dart';
part 'products_response.g.dart';

// Helper functions for easy conversion from/to JSON string
ProductsResponse productListResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductsResponse data) =>
    json.encode(data.toJson());

@customFreezed
abstract class ProductsResponse with _$ProductsResponse {
  @customJsonSerializable
  const factory ProductsResponse({
    String? searchKey,
    @Default([]) List<Product> products, // Default to empty list if null
    int? totalData,
  }) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}
