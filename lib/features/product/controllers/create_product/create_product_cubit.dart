import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../lib.dart';

part 'create_product_state.dart';
part 'create_product_cubit.freezed.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  final ProductService productService;
  CreateProductCubit({required this.productService}) : super(CreateProductState.initial());

  void init() async {}

  void createProduct(Product product) async {
    AppUtils.handleBlocState(
      action: () async {
        await productService.createProduct(product: product);
      },
      emit: emit,
      bloc: this,
      loadingState: CreateProductState.loading,
      successState: (data) => CreateProductState.productCreated(),
      failureState:
          (message, {data}) => CreateProductState.failed(message ?? "Unknown error occurred"),
    );
  }
}
