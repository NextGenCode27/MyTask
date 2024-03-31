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

final class IsUserLoggedInEvent extends AuthEvent {
  final User? user;

  IsUserLoggedInEvent({required this.user});
  @override
  String toString() => 'Auth Register Event';
}

final class AuthLogOutEvent extends AuthEvent {
  @override
  String toString() => 'Auth Register Event';
}
