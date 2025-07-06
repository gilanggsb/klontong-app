import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          builder: (context, child) {
            return LoadingOverlayAlt(child: SafeArea(child: child!));
          },
          routerConfig: AppRoute.instance.routerConfig,
        );
      },
    );
  }
}
