import '../../../lib.dart';

void productInjectionService() {
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(productService: getIt()),
  );
  getIt.registerFactory<ProductDetailCubit>(
    () => ProductDetailCubit(productService: getIt()),
  );
  getIt.registerFactory<CreateProductCubit>(
    () => CreateProductCubit(productService: getIt()),
  );
  getIt.registerLazySingleton<ProductService>(
    () => ProductService(apiService: getIt()),
  );
}
