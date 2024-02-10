part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class SplashLoadInitEvent extends SplashEvent {
  @override
  String toString() {
    return 'SplashLoadInitEvent{}';
  }
}
