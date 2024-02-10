part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class InitialSplashLoadState extends SplashState {
  @override
  String toString() {
    return 'InitialSplashLoadState{}';
  }
}

class LoadingSplashLoadInitState extends SplashState {
  final String mode;

  LoadingSplashLoadInitState({required this.mode});

  @override
  String toString() {
    return 'LoadingSplashLoadInitState{mode: $mode}';
  }
}

class SuccessSplashLoadInitState extends SplashState {
  @override
  String toString() {
    return 'SuccessSplashLoadInitState{}';
  }
}

class ErrorSplashLoadInitState extends SplashState {
  @override
  String toString() {
    return 'ErrorSplashLoadInitState{}';
  }
}
