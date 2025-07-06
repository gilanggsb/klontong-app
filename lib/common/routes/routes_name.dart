enum RouteName {
  productDetail('Product Detail', 'detail'),
  products('Products', '/products'),
  splash('Splash', '/');

  final String name;
  final String pathName;
  const RouteName(this.name, this.pathName);
}
