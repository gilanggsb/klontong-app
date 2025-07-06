import 'package:flutter_bloc/flutter_bloc.dart';

import '../common.dart';

class MyBlocObserver extends BlocObserver {
  // List of blocked BLoC types
  final List<Type> blockedBlocs = [];

  // Define a method to check if a state should be blocked
  bool _isStateBlocked(dynamic state) {
    // Handle specific state types here
    // Add more conditions for other state types here if needed

    return false; // Allow other states by default
  }

  bool _isBlocBlocked(BlocBase bloc) {
    return blockedBlocs.contains(bloc.runtimeType);
  }

  @override
  void onCreate(BlocBase bloc) {
    if (!_isBlocBlocked(bloc)) {
      Logger.info('BlocObs onCreate -- ${bloc.runtimeType}');
    }
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // Logging the change to debug the actual state transition
    // Logger.logInfo(
    //   'onChange triggered for ${bloc.runtimeType} with state ${change.nextState}',
    // );

    if (!_isBlocBlocked(bloc) && !_isStateBlocked(change.nextState)) {
      Logger.info('BlocObs onChange -- ${bloc.runtimeType}, $change');
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (!_isBlocBlocked(bloc)) {
      Logger.info('BlocObs onError -- ${bloc.runtimeType}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    if (!_isBlocBlocked(bloc)) {
      Logger.info('onClose -- ${bloc.runtimeType}');
    }
    super.onClose(bloc);
  }
}
