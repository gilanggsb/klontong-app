// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState()';
}


}

/// @nodoc
class $ProductsStateCopyWith<$Res>  {
$ProductsStateCopyWith(ProductsState _, $Res Function(ProductsState) __);
}


/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductsInitialState value)?  initial,TResult Function( ProductsLoadingState value)?  loading,TResult Function( ProductsLoadedState value)?  loaded,TResult Function( ProductsFetchingMoreDataState value)?  fetchingMoreData,TResult Function( ProductsHasReachedEndState value)?  hasReachedEnd,TResult Function( ProductsFailedState value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductsInitialState() when initial != null:
return initial(_that);case ProductsLoadingState() when loading != null:
return loading(_that);case ProductsLoadedState() when loaded != null:
return loaded(_that);case ProductsFetchingMoreDataState() when fetchingMoreData != null:
return fetchingMoreData(_that);case ProductsHasReachedEndState() when hasReachedEnd != null:
return hasReachedEnd(_that);case ProductsFailedState() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductsInitialState value)  initial,required TResult Function( ProductsLoadingState value)  loading,required TResult Function( ProductsLoadedState value)  loaded,required TResult Function( ProductsFetchingMoreDataState value)  fetchingMoreData,required TResult Function( ProductsHasReachedEndState value)  hasReachedEnd,required TResult Function( ProductsFailedState value)  failed,}){
final _that = this;
switch (_that) {
case ProductsInitialState():
return initial(_that);case ProductsLoadingState():
return loading(_that);case ProductsLoadedState():
return loaded(_that);case ProductsFetchingMoreDataState():
return fetchingMoreData(_that);case ProductsHasReachedEndState():
return hasReachedEnd(_that);case ProductsFailedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductsInitialState value)?  initial,TResult? Function( ProductsLoadingState value)?  loading,TResult? Function( ProductsLoadedState value)?  loaded,TResult? Function( ProductsFetchingMoreDataState value)?  fetchingMoreData,TResult? Function( ProductsHasReachedEndState value)?  hasReachedEnd,TResult? Function( ProductsFailedState value)?  failed,}){
final _that = this;
switch (_that) {
case ProductsInitialState() when initial != null:
return initial(_that);case ProductsLoadingState() when loading != null:
return loading(_that);case ProductsLoadedState() when loaded != null:
return loaded(_that);case ProductsFetchingMoreDataState() when fetchingMoreData != null:
return fetchingMoreData(_that);case ProductsHasReachedEndState() when hasReachedEnd != null:
return hasReachedEnd(_that);case ProductsFailedState() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loaded,TResult Function()?  fetchingMoreData,TResult Function()?  hasReachedEnd,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductsInitialState() when initial != null:
return initial();case ProductsLoadingState() when loading != null:
return loading();case ProductsLoadedState() when loaded != null:
return loaded();case ProductsFetchingMoreDataState() when fetchingMoreData != null:
return fetchingMoreData();case ProductsHasReachedEndState() when hasReachedEnd != null:
return hasReachedEnd();case ProductsFailedState() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loaded,required TResult Function()  fetchingMoreData,required TResult Function()  hasReachedEnd,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case ProductsInitialState():
return initial();case ProductsLoadingState():
return loading();case ProductsLoadedState():
return loaded();case ProductsFetchingMoreDataState():
return fetchingMoreData();case ProductsHasReachedEndState():
return hasReachedEnd();case ProductsFailedState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loaded,TResult? Function()?  fetchingMoreData,TResult? Function()?  hasReachedEnd,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case ProductsInitialState() when initial != null:
return initial();case ProductsLoadingState() when loading != null:
return loading();case ProductsLoadedState() when loaded != null:
return loaded();case ProductsFetchingMoreDataState() when fetchingMoreData != null:
return fetchingMoreData();case ProductsHasReachedEndState() when hasReachedEnd != null:
return hasReachedEnd();case ProductsFailedState() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductsInitialState implements ProductsState {
  const ProductsInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.initial()';
}


}




/// @nodoc


class ProductsLoadingState implements ProductsState {
  const ProductsLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.loading()';
}


}




/// @nodoc


class ProductsLoadedState implements ProductsState {
  const ProductsLoadedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsLoadedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.loaded()';
}


}




/// @nodoc


class ProductsFetchingMoreDataState implements ProductsState {
  const ProductsFetchingMoreDataState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsFetchingMoreDataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.fetchingMoreData()';
}


}




/// @nodoc


class ProductsHasReachedEndState implements ProductsState {
  const ProductsHasReachedEndState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsHasReachedEndState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.hasReachedEnd()';
}


}




/// @nodoc


class ProductsFailedState implements ProductsState {
  const ProductsFailedState(this.message);
  

 final  String message;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsFailedStateCopyWith<ProductsFailedState> get copyWith => _$ProductsFailedStateCopyWithImpl<ProductsFailedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsFailedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductsState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductsFailedStateCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsFailedStateCopyWith(ProductsFailedState value, $Res Function(ProductsFailedState) _then) = _$ProductsFailedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductsFailedStateCopyWithImpl<$Res>
    implements $ProductsFailedStateCopyWith<$Res> {
  _$ProductsFailedStateCopyWithImpl(this._self, this._then);

  final ProductsFailedState _self;
  final $Res Function(ProductsFailedState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductsFailedState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
