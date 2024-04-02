part of 'user_bloc.dart';

@immutable
sealed class UserState {
  @override
  String toString() => 'User State';
}

final class UserInitial extends UserState {
  @override
  String toString() => 'User Initial';
}

final class UserLoading extends UserState {
  @override
  String toString() => 'User Loading';
}

final class UserSuccess extends UserState {
  final UserEntity userEntity;

  UserSuccess({required this.userEntity});
  @override
  String toString() => 'User Success';
}

final class UserFailed extends UserState {
  final String message;

  UserFailed({required this.message});
  @override
  String toString() => 'User Failed';
}
