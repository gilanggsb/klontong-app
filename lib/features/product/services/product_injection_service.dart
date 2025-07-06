import '../../../lib.dart';

void productInjectionService() {
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(productService: getIt()),
  );
  getIt.registerLazySingleton<ProductService>(
    () => ProductService(apiService: getIt()),
  );
}
