import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(currentIndex: 0)) {
    on<HomeCurrentIndexEvent>(_mapHomeCurrentIndexEventToState);
  }

  FutureOr<void> _mapHomeCurrentIndexEventToState(
      HomeCurrentIndexEvent event, Emitter<HomeState> emit) {
    emit(HomeCurrentIndexSuccess(currentIndex: event.currentIndex));
  }
}
