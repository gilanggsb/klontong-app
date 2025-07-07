// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState()';
}


}

/// @nodoc
class $ProductDetailStateCopyWith<$Res>  {
$ProductDetailStateCopyWith(ProductDetailState _, $Res Function(ProductDetailState) __);
}


/// Adds pattern-matching-related methods to [ProductDetailState].
extension ProductDetailStatePatterns on ProductDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductDetailInitialState value)?  initial,TResult Function( ProductDetailLoadingState value)?  loading,TResult Function( ProductDetailLoadedState value)?  loaded,TResult Function( ProductDetailFailedState value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductDetailInitialState() when initial != null:
return initial(_that);case ProductDetailLoadingState() when loading != null:
return loading(_that);case ProductDetailLoadedState() when loaded != null:
return loaded(_that);case ProductDetailFailedState() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductDetailInitialState value)  initial,required TResult Function( ProductDetailLoadingState value)  loading,required TResult Function( ProductDetailLoadedState value)  loaded,required TResult Function( ProductDetailFailedState value)  failed,}){
final _that = this;
switch (_that) {
case ProductDetailInitialState():
return initial(_that);case ProductDetailLoadingState():
return loading(_that);case ProductDetailLoadedState():
return loaded(_that);case ProductDetailFailedState():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductDetailInitialState value)?  initial,TResult? Function( ProductDetailLoadingState value)?  loading,TResult? Function( ProductDetailLoadedState value)?  loaded,TResult? Function( ProductDetailFailedState value)?  failed,}){
final _that = this;
switch (_that) {
case ProductDetailInitialState() when initial != null:
return initial(_that);case ProductDetailLoadingState() when loading != null:
return loading(_that);case ProductDetailLoadedState() when loaded != null:
return loaded(_that);case ProductDetailFailedState() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loaded,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductDetailInitialState() when initial != null:
return initial();case ProductDetailLoadingState() when loading != null:
return loading();case ProductDetailLoadedState() when loaded != null:
return loaded();case ProductDetailFailedState() when failed != null:
return failed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loaded,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case ProductDetailInitialState():
return initial();case ProductDetailLoadingState():
return loading();case ProductDetailLoadedState():
return loaded();case ProductDetailFailedState():
return failed(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loaded,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case ProductDetailInitialState() when initial != null:
return initial();case ProductDetailLoadingState() when loading != null:
return loading();case ProductDetailLoadedState() when loaded != null:
return loaded();case ProductDetailFailedState() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductDetailInitialState implements ProductDetailState {
  const ProductDetailInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState.initial()';
}


}




/// @nodoc


class ProductDetailLoadingState implements ProductDetailState {
  const ProductDetailLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState.loading()';
}


}




/// @nodoc


class ProductDetailLoadedState implements ProductDetailState {
  const ProductDetailLoadedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailLoadedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState.loaded()';
}


}




/// @nodoc


class ProductDetailFailedState implements ProductDetailState {
  const ProductDetailFailedState(this.message);
  

 final  String message;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailFailedStateCopyWith<ProductDetailFailedState> get copyWith => _$ProductDetailFailedStateCopyWithImpl<ProductDetailFailedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailFailedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductDetailState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductDetailFailedStateCopyWith<$Res> implements $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailFailedStateCopyWith(ProductDetailFailedState value, $Res Function(ProductDetailFailedState) _then) = _$ProductDetailFailedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductDetailFailedStateCopyWithImpl<$Res>
    implements $ProductDetailFailedStateCopyWith<$Res> {
  _$ProductDetailFailedStateCopyWithImpl(this._self, this._then);

  final ProductDetailFailedState _self;
  final $Res Function(ProductDetailFailedState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductDetailFailedState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
