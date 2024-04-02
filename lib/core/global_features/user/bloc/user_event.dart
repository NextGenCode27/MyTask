part of 'user_bloc.dart';

@immutable
sealed class UserEvent {
  @override
  String toString() => 'User Event';
}

final class GetCurrentUserDataEvent extends UserEvent {}
