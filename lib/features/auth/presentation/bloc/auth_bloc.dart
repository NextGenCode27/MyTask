import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/features/auth/domain/usecase/login_usecase.dart';
import 'package:my_task/features/auth/domain/usecase/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecas _registerUsecas;
  AuthBloc(
      {required LoginUsecase loginUsecase,
      required RegisterUsecas registerUsecas})
      : _loginUsecase = loginUsecase,
        _registerUsecas = registerUsecas,
        super(AuthInitial()) {
    on<AuthEvent>(_mapAuthEventToState);
    on<AuthRegisterEvent>(_mapAuthRegisterEventToState);
    on<AuthLoginEvent>(_mapAuthLoginEventToState);
  }

  FutureOr<void> _mapAuthEventToState(
      AuthEvent event, Emitter<AuthState> emit) {
    emit(AuthLoading());
  }

  FutureOr<void> _mapAuthRegisterEventToState(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    final res = await _registerUsecas.call(
      RegisterParams(
        username: event.params.username,
        email: event.params.email,
        phone: event.params.phone,
        password: event.params.password,
      ),
    );
    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (userId) => emit(AuthSuccess(userId: userId)),
    );
  }

  FutureOr<void> _mapAuthLoginEventToState(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    final res = await _loginUsecase.call(
      LoginParams(
        email: event.params.email,
        password: event.params.password,
      ),
    );
    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (userId) => emit(AuthSuccess(userId: userId)),
    );
  }
}
