import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(InitialSplashLoadState()) {
    // SplashLoadInitEvent
    on<SplashLoadInitEvent>((event, emit) => mapSplashLoadInitEventToState(event, emit));
  }

  Future<void> mapSplashLoadInitEventToState(SplashLoadInitEvent event, Emitter<SplashState> emit) async {
    try {
      emit(LoadingSplashLoadInitState(mode: 'Unleash key'));
      await Future.delayed(const Duration(seconds: 2));

      emit(LoadingSplashLoadInitState(mode: 'Initial data'));
      await Future.delayed(const Duration(seconds: 2));

      emit(LoadingSplashLoadInitState(mode: 'Complete'));
      await Future.delayed(const Duration(seconds: 2));

      emit(SuccessSplashLoadInitState());
    } catch (e) {
      emit(ErrorSplashLoadInitState());
    }
  }
}
