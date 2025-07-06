// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  categoryName: json['category_name'] as String?,
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  image: json['image'] as String?,
  price: json['price'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'sku': instance.sku,
  'name': instance.name,
  'description': instance.description,
  'weight': instance.weight,
  'width': instance.width,
  'length': instance.length,
  'height': instance.height,
  'image': instance.image,
  'price': instance.price,
};
