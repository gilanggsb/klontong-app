// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationParams {

 int? get limit; int? get offset; String? get searchKey;
/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationParamsCopyWith<PaginationParams> get copyWith => _$PaginationParamsCopyWithImpl<PaginationParams>(this as PaginationParams, _$identity);

  /// Serializes this PaginationParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.searchKey, searchKey) || other.searchKey == searchKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,searchKey);

@override
String toString() {
  return 'PaginationParams(limit: $limit, offset: $offset, searchKey: $searchKey)';
}


}

/// @nodoc
abstract mixin class $PaginationParamsCopyWith<$Res>  {
  factory $PaginationParamsCopyWith(PaginationParams value, $Res Function(PaginationParams) _then) = _$PaginationParamsCopyWithImpl;
@useResult
$Res call({
 int? limit, int? offset, String? searchKey
});




}
/// @nodoc
class _$PaginationParamsCopyWithImpl<$Res>
    implements $PaginationParamsCopyWith<$Res> {
  _$PaginationParamsCopyWithImpl(this._self, this._then);

  final PaginationParams _self;
  final $Res Function(PaginationParams) _then;

/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = freezed,Object? offset = freezed,Object? searchKey = freezed,}) {
  return _then(_self.copyWith(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,searchKey: freezed == searchKey ? _self.searchKey : searchKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationParams].
extension PaginationParamsPatterns on PaginationParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationParams value)  $default,){
final _that = this;
switch (_that) {
case _PaginationParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationParams value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? limit,  int? offset,  String? searchKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
return $default(_that.limit,_that.offset,_that.searchKey);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? limit,  int? offset,  String? searchKey)  $default,) {final _that = this;
switch (_that) {
case _PaginationParams():
return $default(_that.limit,_that.offset,_that.searchKey);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? limit,  int? offset,  String? searchKey)?  $default,) {final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
return $default(_that.limit,_that.offset,_that.searchKey);case _:
  return null;

}
}

}

/// @nodoc

@customJsonSerializable
class _PaginationParams implements PaginationParams {
  const _PaginationParams({this.limit, this.offset, this.searchKey});
  factory _PaginationParams.fromJson(Map<String, dynamic> json) => _$PaginationParamsFromJson(json);

@override final  int? limit;
@override final  int? offset;
@override final  String? searchKey;

/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationParamsCopyWith<_PaginationParams> get copyWith => __$PaginationParamsCopyWithImpl<_PaginationParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.searchKey, searchKey) || other.searchKey == searchKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,searchKey);

@override
String toString() {
  return 'PaginationParams(limit: $limit, offset: $offset, searchKey: $searchKey)';
}


}

/// @nodoc
abstract mixin class _$PaginationParamsCopyWith<$Res> implements $PaginationParamsCopyWith<$Res> {
  factory _$PaginationParamsCopyWith(_PaginationParams value, $Res Function(_PaginationParams) _then) = __$PaginationParamsCopyWithImpl;
@override @useResult
$Res call({
 int? limit, int? offset, String? searchKey
});




}
/// @nodoc
class __$PaginationParamsCopyWithImpl<$Res>
    implements _$PaginationParamsCopyWith<$Res> {
  __$PaginationParamsCopyWithImpl(this._self, this._then);

  final _PaginationParams _self;
  final $Res Function(_PaginationParams) _then;

/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = freezed,Object? offset = freezed,Object? searchKey = freezed,}) {
  return _then(_PaginationParams(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,searchKey: freezed == searchKey ? _self.searchKey : searchKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
