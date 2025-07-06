import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../lib.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@customFreezed
abstract class Product with _$Product {
  @customJsonSerializable
  const factory Product({
    int? id,
    int? categoryId,
    String? categoryName,
    String? sku,
    String? name,
    String? description,
    int? weight,
    int? width,
    int? length,
    int? height,
    String? image,
    String? price, // Keep as String if it comes with '$' prefix
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
