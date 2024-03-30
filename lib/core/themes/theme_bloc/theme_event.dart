part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {
  @override
  String toString() => 'Theme Event';
}

final class SetThemeEvent extends ThemeEvent {
  @override
  String toString() => 'Set Theme Event';
}

final class GetThemeEvent extends ThemeEvent {
  @override
  String toString() => 'Set Theme Event';
}
