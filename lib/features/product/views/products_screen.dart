import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../lib.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsCubit productsCubit;

  @override
  void initState() {
    productsCubit = getIt.get<ProductsCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productsCubit,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                hintText: "Search products",
                leading: const Icon(Icons.search),
                onChanged: productsCubit.onSearch,
              ),
            ),
            BlocConsumer<ProductsCubit, ProductsState>(
              listener: (context, state) {
                switch (state) {
                  case ProductsFailedState(:final message):
                    SnackbarManager.showErrorSnackbar(message: message);
                    break;
                  default:
                }
              },
              builder: (context, state) {
                final isLoading = switch (state) {
                  ProductsLoadingState() => true,
                  _ => false,
                };

                final isFetchingMoreData = switch (state) {
                  ProductsFetchingMoreDataState() => true,
                  _ => false,
                };

                final products =
                    isLoading ? MockData.products : productsCubit.products;
                return DefaultRefreshIndicator(
                  onRefresh: productsCubit.onRefresh,
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: ConditionalWidget(
                      showTrueWidget: products.isNotEmpty,
                      trueWidget: ListView.separated(
                        controller: productsCubit.scrollController,
                        itemCount:
                            products.length + (isFetchingMoreData ? 1 : 0),
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 10,
                        ),
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          if (index >= products.length) {
                            return Center(
                              key: ValueKey(index),
                              child: DefaultCircularProgressIndicator.blue(),
                            );
                          }

                          final product = products[index];
                          return Card(
                            key: ValueKey(product.id),
                            child: ListTile(
                              title: Text(product.name ?? "-"),
                              subtitle: Text(
                                product.description ?? "-",
                                maxLines: 2,
                              ),
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    isLoading
                                        ? null
                                        : NetworkImage(product.image ?? "-"),
                              ),
                            ),
                          );
                        },
                      ),
                      falseWidget: Center(
                        child: EmptyStateWidget.dataNotfound(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
