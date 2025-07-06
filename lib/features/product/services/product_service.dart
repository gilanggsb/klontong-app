import '../../../lib.dart';

class ProductService {
  final ApiService apiService;

  ProductService({required this.apiService});

  Future<ProductsResponse?> fetchProducts({
    required PaginationParams paginationParams,
  }) async {
    try {
      final res = await apiService.get(
        URL.products,
        queryParams: paginationParams.toJson(),
        fromJsonT: (json) => ProductsResponse.fromJson(json),
        // addLogger: true,
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
