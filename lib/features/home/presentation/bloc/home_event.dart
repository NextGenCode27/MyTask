part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  @override
  String toString() => 'Home Event';
}

final class HomeCurrentIndexEvent extends HomeEvent {
  final int currentIndex;

  HomeCurrentIndexEvent({required this.currentIndex});
  @override
  String toString() => 'Home Current Index Event';
}
