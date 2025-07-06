import '../../../lib.dart';

void splashInjectionService() {
  getIt.registerFactory<SplashCubit>(() => SplashCubit());
}
