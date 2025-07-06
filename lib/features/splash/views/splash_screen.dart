import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../lib.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit splashCubit;

  @override
  void initState() {
    super.initState();
    splashCubit = getIt.get<SplashCubit>()..init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashCubit,
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            switch (state) {
              case SplashLoadedState():
                NavigationService.pushReplacementNamed(RouteName.products);
                break;
              default:
            }
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Text(
                  "Klontong Apps",
                  style: AppStyle.text.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocSelector<SplashCubit, SplashState, bool>(
                  selector: (state) => state is SplashLoadingState,
                  builder: (context, isLoading) {
                    if (!isLoading) return SizedBox();
                    return const DefaultCircularProgressIndicator(size: 32);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
