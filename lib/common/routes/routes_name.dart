enum RouteName {
  productDetail('Product Detail', '/products/:product_id'),
  products('Products', '/products'),
  splash('Splash', '/');

  final String name;
  final String pathName;
  const RouteName(this.name, this.pathName);
}
