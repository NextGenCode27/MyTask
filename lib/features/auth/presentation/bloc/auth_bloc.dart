import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/auth/domain/usecase/login_usecase.dart';
import 'package:my_task/features/auth/domain/usecase/logout_usecase.dart';
import 'package:my_task/features/auth/domain/usecase/register_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecas _registerUsecas;
  final LogOutUsecase _logOutUsecase;
  final SupabaseClient _supabaseClient;

  AuthBloc({
    required LoginUsecase loginUsecase,
    required RegisterUsecas registerUsecas,
    required LogOutUsecase logOutUsecase,
    required SupabaseClient supabaseClient,
  })  : _loginUsecase = loginUsecase,
        _registerUsecas = registerUsecas,
        _logOutUsecase = logOutUsecase,
        _supabaseClient = supabaseClient,
        super(AuthInitial()) {
    _supabaseClient.auth.onAuthStateChange.listen(
      (data) {
        add(IsUserLoggedInEvent(user: data.session?.user));
      },
    );
    on<AuthEvent>(_mapAuthEventToState);
    on<AuthRegisterEvent>(_mapAuthRegisterEventToState);
    on<AuthLoginEvent>(_mapAuthLoginEventToState);
    on<IsUserLoggedInEvent>(_mapIsUserLoggedInEventToState);
    on<AuthLogOutEvent>(_mapAuthLogOutEventToState);
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
      (user) => emit(AuthSuccess(user: user)),
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
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  FutureOr<void> _mapIsUserLoggedInEventToState(
      IsUserLoggedInEvent event, Emitter<AuthState> emit) async {
    if (event.user != null) {
      emit(AuthSuccess(user: event.user));
    } else {
      emit(AuthFailed(message: 'User Not Logged In'));
    }
  }

  FutureOr<void> _mapAuthLogOutEventToState(
      AuthLogOutEvent event, Emitter<AuthState> emit) async {
    final res = await _logOutUsecase.call(NoParams());
    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (user) => emit(AuthLogOut()),
    );
  }
}
