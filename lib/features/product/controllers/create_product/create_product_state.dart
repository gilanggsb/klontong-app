part of 'create_product_cubit.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = CreateProductInitialState;
  const factory CreateProductState.loading() = CreateProductLoadingState;
  const factory CreateProductState.loaded() = CreateProductLoadedState;
  const factory CreateProductState.productCreated() = CreateProductProductCreatedState;
  const factory CreateProductState.failed(String message) = CreateProductFailedState;
}
