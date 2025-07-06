part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = ProductsInitialState;
  const factory ProductsState.loading() = ProductsLoadingState;
  const factory ProductsState.loaded() = ProductsLoadedState;
  const factory ProductsState.fetchingMoreData() =
      ProductsFetchingMoreDataState;
  const factory ProductsState.hasReachedEnd() = ProductsHasReachedEndState;
  const factory ProductsState.failed(String message) = ProductsFailedState;
}
