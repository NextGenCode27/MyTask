part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  @override
  String toString() => 'Auth Event';
}

final class AuthRegisterEvent extends AuthEvent {
  final RegisterParams params;

  AuthRegisterEvent({required this.params});
  @override
  String toString() => 'Auth Register Event';
}

final class AuthLoginEvent extends AuthEvent {
  final LoginParams params;

  AuthLoginEvent({required this.params});
  @override
  String toString() => 'Auth Register Event';
}
