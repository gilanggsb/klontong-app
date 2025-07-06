import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void init() async {
    emit(SplashState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashState.loaded());
  }
}
