import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../lib.dart';

abstract class NavigationService {
  static Future<T?> pushNamed<T>(
    RouteName routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    return await globalNavigatorKey.currentContext?.pushNamed<T>(
      routeName.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void pushReplacementNamed(
    RouteName routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    globalNavigatorKey.currentContext?.replaceNamed(
      routeName.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void pop([dynamic returnData, BuildContext? context]) {
    return (context ?? globalNavigatorKey.currentContext)?.pop(returnData);
  }
}
