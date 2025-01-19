import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpolBlocObserver implements BlocObserver {
  @override
  void onClose(BlocBase bloc) {
    log('the On Close Bloc is ..........$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('the On Create Bloc is ..........$bloc');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('the On Change Bloc is ..........$change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('the On Change Bloc is ..........$bloc the error is $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('the On Event Bloc is ..........$event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
