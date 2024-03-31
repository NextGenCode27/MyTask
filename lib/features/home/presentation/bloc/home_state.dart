part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  @override
  String toString() => 'Home State';
}

final class HomeInitial extends HomeState {
  final int currentIndex;

  HomeInitial({required this.currentIndex});
  @override
  String toString() => 'Home Initial';
}

final class HomeCurrentIndexSuccess extends HomeState {
  final int currentIndex;

  HomeCurrentIndexSuccess({required this.currentIndex});
  @override
  String toString() => 'Home Current Index Success';
}

final class HomeFailed extends HomeState {
  final String message;

  HomeFailed({required this.message});
  @override
  String toString() => 'Home Failed';
}
