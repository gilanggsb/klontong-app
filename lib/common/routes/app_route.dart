import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../lib.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  AppRoute._();

  static final instance = AppRoute._();

  // GoRouter configuration
  final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: globalNavigatorKey,
    observers: [RouterObserver()],
    initialLocation: RouteName.splash.pathName,
    routes: [
      GoRoute(
        name: RouteName.splash.name,
        path: RouteName.splash.pathName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: RouteName.products.name,
        path: RouteName.products.pathName,
        builder: (context, state) => const ProductsScreen(),
        routes: [
          GoRoute(
            name: RouteName.productDetail.name,
            path: RouteName.productDetail.pathName,
            builder: (context, state) {
              final productId = int.tryParse(state.pathParameters['product_id'] ?? "") ?? 0;
              return ProductDetailScreen(productId: productId);
            },
          ),
        ],
      ),
    ],
  );
}
