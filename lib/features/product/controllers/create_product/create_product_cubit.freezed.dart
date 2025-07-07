// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState()';
}


}

/// @nodoc
class $CreateProductStateCopyWith<$Res>  {
$CreateProductStateCopyWith(CreateProductState _, $Res Function(CreateProductState) __);
}


/// Adds pattern-matching-related methods to [CreateProductState].
extension CreateProductStatePatterns on CreateProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateProductInitialState value)?  initial,TResult Function( CreateProductLoadingState value)?  loading,TResult Function( CreateProductLoadedState value)?  loaded,TResult Function( CreateProductProductCreatedState value)?  productCreated,TResult Function( CreateProductFailedState value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateProductInitialState() when initial != null:
return initial(_that);case CreateProductLoadingState() when loading != null:
return loading(_that);case CreateProductLoadedState() when loaded != null:
return loaded(_that);case CreateProductProductCreatedState() when productCreated != null:
return productCreated(_that);case CreateProductFailedState() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateProductInitialState value)  initial,required TResult Function( CreateProductLoadingState value)  loading,required TResult Function( CreateProductLoadedState value)  loaded,required TResult Function( CreateProductProductCreatedState value)  productCreated,required TResult Function( CreateProductFailedState value)  failed,}){
final _that = this;
switch (_that) {
case CreateProductInitialState():
return initial(_that);case CreateProductLoadingState():
return loading(_that);case CreateProductLoadedState():
return loaded(_that);case CreateProductProductCreatedState():
return productCreated(_that);case CreateProductFailedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateProductInitialState value)?  initial,TResult? Function( CreateProductLoadingState value)?  loading,TResult? Function( CreateProductLoadedState value)?  loaded,TResult? Function( CreateProductProductCreatedState value)?  productCreated,TResult? Function( CreateProductFailedState value)?  failed,}){
final _that = this;
switch (_that) {
case CreateProductInitialState() when initial != null:
return initial(_that);case CreateProductLoadingState() when loading != null:
return loading(_that);case CreateProductLoadedState() when loaded != null:
return loaded(_that);case CreateProductProductCreatedState() when productCreated != null:
return productCreated(_that);case CreateProductFailedState() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loaded,TResult Function()?  productCreated,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateProductInitialState() when initial != null:
return initial();case CreateProductLoadingState() when loading != null:
return loading();case CreateProductLoadedState() when loaded != null:
return loaded();case CreateProductProductCreatedState() when productCreated != null:
return productCreated();case CreateProductFailedState() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loaded,required TResult Function()  productCreated,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case CreateProductInitialState():
return initial();case CreateProductLoadingState():
return loading();case CreateProductLoadedState():
return loaded();case CreateProductProductCreatedState():
return productCreated();case CreateProductFailedState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loaded,TResult? Function()?  productCreated,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case CreateProductInitialState() when initial != null:
return initial();case CreateProductLoadingState() when loading != null:
return loading();case CreateProductLoadedState() when loaded != null:
return loaded();case CreateProductProductCreatedState() when productCreated != null:
return productCreated();case CreateProductFailedState() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CreateProductInitialState implements CreateProductState {
  const CreateProductInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.initial()';
}


}




/// @nodoc


class CreateProductLoadingState implements CreateProductState {
  const CreateProductLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.loading()';
}


}




/// @nodoc


class CreateProductLoadedState implements CreateProductState {
  const CreateProductLoadedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductLoadedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.loaded()';
}


}




/// @nodoc


class CreateProductProductCreatedState implements CreateProductState {
  const CreateProductProductCreatedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductProductCreatedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.productCreated()';
}


}




/// @nodoc


class CreateProductFailedState implements CreateProductState {
  const CreateProductFailedState(this.message);
  

 final  String message;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProductFailedStateCopyWith<CreateProductFailedState> get copyWith => _$CreateProductFailedStateCopyWithImpl<CreateProductFailedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductFailedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateProductState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateProductFailedStateCopyWith<$Res> implements $CreateProductStateCopyWith<$Res> {
  factory $CreateProductFailedStateCopyWith(CreateProductFailedState value, $Res Function(CreateProductFailedState) _then) = _$CreateProductFailedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateProductFailedStateCopyWithImpl<$Res>
    implements $CreateProductFailedStateCopyWith<$Res> {
  _$CreateProductFailedStateCopyWithImpl(this._self, this._then);

  final CreateProductFailedState _self;
  final $Res Function(CreateProductFailedState) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateProductFailedState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
