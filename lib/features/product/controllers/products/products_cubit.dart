import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../lib.dart';

part 'products_cubit.freezed.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductService productService;
  late ScrollController? scrollController;

  ProductsCubit({required this.productService}) : super(ProductsState.initial()) {
    scrollController = ScrollController();
  }

  List<Product> products = [];
  bool hasReachedEnd = false;
  bool isLoading = false;
  bool isScrollControllerInitialized = false;

  PaginationParams paginationParams = PaginationParams(limit: 10, offset: 0, searchKey: '');

  void init() async {
    initScrollController();
    AppUtils.handleBlocState(
      action: () async {
        final res = await productService.fetchProducts(paginationParams: paginationParams);

        if (res == null) return;

        if (res.products.isEmpty) {
          hasReachedEnd = true;
          emit(ProductsState.hasReachedEnd());
        }

        products = res.products;
      },
      emit: emit,
      bloc: this,
      loadingState: () => ProductsState.loading(),
      successState: (data) => ProductsState.loaded(),
      failureState: (message, {data}) => ProductsState.failed(message ?? "Unknwon error occurred"),
    );
  }

  void onSearch(String searchKey) {
    Debouncer.run(() {
      resetState();
      paginationParams = paginationParams.copyWith(searchKey: searchKey);
      init();
    });
  }

  Future<void> onRefresh() async {
    resetState();
    init();
  }

  void resetState() async {
    paginationParams = PaginationParams(limit: 10, offset: 0, searchKey: "");
    hasReachedEnd = false;
    isLoading = false;
    products = [];
  }

  void initScrollController() {
    if (isScrollControllerInitialized) return;
    scrollController?.addListener(() {
      if ((scrollController?.position.pixels ?? 0) <
          (scrollController?.position.maxScrollExtent ?? 0)) {
        return;
      }
      Logger.info("CEKKK ");

      if (hasReachedEnd || isLoading) {
        return;
      }

      nextPage();
    });
    isScrollControllerInitialized = true;
  }

  void nextPage() async {
    AppUtils.handleBlocState(
      action: () async {
        paginationParams = paginationParams.copyWith(
          offset: (paginationParams.offset ?? 0) + (paginationParams.limit ?? 0),
        );

        final res = await productService.fetchProducts(paginationParams: paginationParams);
        if (res == null) return;

        if (res.products.isEmpty) {
          hasReachedEnd = true;
          emit(ProductsState.hasReachedEnd());
          return;
        }

        products = [...products, ...res.products];
      },
      emit: emit,
      bloc: this,
      loadingState: () => ProductsState.fetchingMoreData(),
      successState: (data) => ProductsState.loaded(),
      failureState: (message, {data}) => ProductsState.failed(message ?? "Unknwon error occurred"),
    );
  }

  @override
  Future<void> close() {
    scrollController?.dispose();
    return super.close();
  }
}
