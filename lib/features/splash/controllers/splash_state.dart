part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = SplashInitialState;
  const factory SplashState.loading() = SplashLoadingState;
  const factory SplashState.loaded() = SplashLoadedState;
}
