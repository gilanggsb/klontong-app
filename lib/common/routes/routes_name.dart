enum RouteName {
  createProduct('Create Product', '/create'),
  productDetail('Product Detail', '/:product_id'),
  products('Products', '/products'),
  splash('Splash', '/');

  final String name;
  final String pathName;
  const RouteName(this.name, this.pathName);
}
