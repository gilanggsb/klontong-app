import '../../../lib.dart';

class ProductService {
  final ApiService apiService;

  ProductService({required this.apiService});

  Future<ProductsResponse?> fetchProducts({required PaginationParams paginationParams}) async {
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

  Future<Product?> fetchProduct({required int productId}) async {
    try {
      final res = await apiService.get(
        URL.productById(productId),
        fromJsonT: (json) => Product.fromJson(json),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product?> createProduct({required Product product}) async {
    try {
      final res = await apiService.post(
        URL.products,
        body: product.toJson(),
        fromJsonT: (json) => Product.fromJson(json),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
