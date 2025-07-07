// ignore: unused_import
import 'package:dio/dio.dart';

import '../../lib.dart';

class URL {
  static String base = Env.baseUrl;

  static String products = "$base/products";
  static String productById(int productId) => "$base/products/$productId";
}
