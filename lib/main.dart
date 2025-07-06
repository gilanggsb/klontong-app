import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'lib.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppPalette.whiteBase,
      statusBarBrightness: Brightness.light,
    ),
  );

  await Future.wait([
    InjectorService.create(),
    initializeDateFormatting(),
    ScreenUtil.ensureScreenSize(),
  ]);

  runApp(RequestsInspector(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp.router(
            routerConfig: AppRoute.instance.routerConfig,
            title: "Klontong Apps",
            theme: ThemeData(primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
            builder:
                (context, child) =>
                    SafeArea(child: LoadingOverlayAlt(child: child!)),
          ),
    );
  }
}
