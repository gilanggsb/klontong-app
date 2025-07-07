import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib.dart'; // Assuming this imports necessary utilities like getIt, AppStyle, AppPalette, SnackbarManager, etc.

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailCubit productDetailCubit;

  @override
  void initState() {
    productDetailCubit = getIt.get<ProductDetailCubit>()..init(newProductId: widget.productId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productDetailCubit,
      child: BlocListener<ProductDetailCubit, ProductDetailState>(
        listener: (context, state) {
          dismissLoading();
          switch (state) {
            case ProductDetailLoadingState():
              showLoading();
              break;
            case ProductDetailFailedState(:final message):
              SnackbarManager.showErrorSnackbar(message: message);
              break;
            default:
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: BlocSelector<ProductDetailCubit, ProductDetailState, String>(
              selector: (state) => productDetailCubit.product?.name ?? "-",
              builder: (context, productName) {
                return Text(
                  productName,
                  style: AppStyle.text.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                );
              },
            ),
          ),
          body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              final product =
                  productDetailCubit.product; // Access product directly from cubit state

              if (product == null && state is! ProductDetailLoadingState) {
                return DefaultRefreshIndicator(
                  onRefresh: productDetailCubit.onRefresh,
                  child: Center(
                    child: Text(
                      state is ProductDetailFailedState
                          ? state.message
                          : "No product data available. Pull to refresh.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              return DefaultRefreshIndicator(
                onRefresh: productDetailCubit.onRefresh,
                child: ListView(
                  padding: const EdgeInsets.all(14),
                  children: [
                    // Image and Error Handling
                    Image.network(
                      product?.image ??
                          '', // Provide an empty string instead of "-" for Image.network
                      height: context.getHeight * 0.2,
                      fit: BoxFit.cover, // Added fit for better image display
                      errorBuilder:
                          (context, error, stackTrace) => ColoredBox(
                            color: AppPalette.grey40,
                            child: SizedBox(
                              height: context.getHeight * 0.2,
                              child: const Icon(
                                Icons.error,
                                color: AppPalette.redBase,
                                size: 34,
                              ), // Added color to icon
                            ),
                          ),
                    ),
                    const SizedBox(height: 20),
                    _DetailRow(title: "Nama : ", value: product?.name ?? "-"),
                    _DetailRow(title: "Kategori : ", value: product?.categoryName ?? "-"),
                    _DetailRow(
                      title: "Size (P x L x T) : ",
                      value:
                          "${product?.length ?? 0}cm x ${product?.width ?? 0}cm x ${product?.height ?? 0}cm",
                    ),
                    _DetailRow(title: "SKU : ", value: product?.sku ?? "-"),
                    _DetailRow(title: "Harga : ", value: "Rp. ${product?.price ?? 0}"),
                    _DetailRow(title: "Deskripsi : ", value: product?.description ?? "-"),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String title;
  final String value;
  const _DetailRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyle.text.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: AppStyle.text),
        ],
      ),
    );
  }
}
