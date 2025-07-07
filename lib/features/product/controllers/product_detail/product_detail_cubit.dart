import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../lib.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductService productService;

  ProductDetailCubit({required this.productService}) : super(ProductDetailState.initial());

  Product? product;
  int? productId;

  void init({int? newProductId}) async {
    AppUtils.handleBlocState(
      action: () async {
        productId ??= newProductId;
        product = await productService.fetchProduct(productId: productId ?? 0);
      },
      emit: emit,
      bloc: this,
      loadingState: () => ProductDetailState.loading(),
      successState: (data) => ProductDetailState.loaded(),
      failureState:
          (message, {data}) => ProductDetailState.failed(message ?? "Unknown error occurred"),
    );
  }

  Future<void> onRefresh() async {
    resetState();
    init();
  }

  void resetState() {
    product = null;
  }
}
