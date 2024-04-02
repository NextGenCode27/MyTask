import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global_features/themes/domain/usecase/get_theme_usecase.dart';
import 'package:my_task/core/global_features/themes/domain/usecase/set_theme_usecase.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/light_theme.dart';
import 'package:my_task/core/usecase/usecase.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SetThemeUsecase _setThemeUsecase;
  final GetThemeUsecase _getThemeUsecase;
  ThemeBloc(
      {required SetThemeUsecase setThemeUsecase,
      required GetThemeUsecase getThemeUsecase})
      : _setThemeUsecase = setThemeUsecase,
        _getThemeUsecase = getThemeUsecase,
        super(ThemeInitial(themeData: lightTheme)) {
    on<SetThemeEvent>(_mapSetThemeEventToState);
    on<GetThemeEvent>(_mapGetThemeEventToState);
  }

  FutureOr<void> _mapSetThemeEventToState(
      SetThemeEvent event, Emitter<ThemeState> emit) async {
    final res = await _setThemeUsecase.call(NoParams());

    res.fold(
      (error) => emit(ThemeFailed(message: error.message)),
      (theme) => emit(ThemeSetSuccess(themeData: theme)),
    );
  }

  FutureOr<void> _mapGetThemeEventToState(
      GetThemeEvent event, Emitter<ThemeState> emit) async {
    final res = await _getThemeUsecase.call(NoParams());

    res.fold(
      (error) => emit(ThemeFailed(message: error.message)),
      (theme) => emit(ThemeGetSuccess(themeData: theme)),
    );
  }
}
