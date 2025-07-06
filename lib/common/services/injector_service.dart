import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../lib.dart';

final GetIt getIt = GetIt.instance;

class InjectorService {
  const InjectorService();

  void moduleInjection({bool isTesting = false}) {
    if (!isTesting) {
      getIt.registerSingletonAsync<GetStorage>(() async {
        await GetStorage.init();
        return GetStorage();
      });
    }
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerSingletonAsync<PackageInfo>(() async {
      return await PackageInfo.fromPlatform();
    });
  }

  void serviceInjection({bool isTesting = false}) async {
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(dio: getIt(), isTesting: isTesting),
    );
    if (!isTesting) {
      getIt.registerLazySingleton<StorageService>(
        () => StorageService(getIt<GetStorage>()),
      );
    }
  }

  Future<void> setupLocator({bool isTesting = false}) async {
    //module
    moduleInjection(isTesting: isTesting);
    //service
    serviceInjection(isTesting: isTesting);
    //feature
    splashInjectionService();
    productInjectionService();
  }

  static Future<void> create({bool isTesting = false}) async {
    const injectorService = InjectorService();
    injectorService.setupLocator(isTesting: isTesting);
    await getIt.allReady();
  }
}
