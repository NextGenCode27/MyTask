part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  @override
  String toString() => 'Auth State';
}

final class AuthInitial extends AuthState {
  @override
  String toString() => 'Auth Initial';
}

final class AuthLoading extends AuthState {
  @override
  String toString() => 'Auth Loading';
}

final class AuthSuccess extends AuthState {
  final User? user;

  AuthSuccess({required this.user});
  @override
  String toString() => 'Auth Auccess';
}

final class AuthLogOut extends AuthState {
  @override
  String toString() => 'Auth Auccess';
}

final class AuthFailed extends AuthState {
  final String message;
  AuthFailed({required this.message});
  @override
  String toString() => 'Auth Failed';
}
