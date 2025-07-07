part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = ProductDetailInitialState;
  const factory ProductDetailState.loading() = ProductDetailLoadingState;
  const factory ProductDetailState.loaded() = ProductDetailLoadedState;
  const factory ProductDetailState.failed(String message) = ProductDetailFailedState;
}
