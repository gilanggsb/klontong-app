import '../../lib.dart';

abstract class MockData {
  static final List<Product> products = List.generate(
    10,
    (index) => Product(
      id: index + 1,
      name: 'Product ${index + 1}',
      price: "${(index + 1) * 10.0}",
      description: 'Description for product ${index + 1}',
      image: 'https://example.com/product${index + 1}.jpg',
    ),
  );
}
