part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenEvent {}

class SplashScreenStartUpEvent extends SplashScreenEvent {
  final BuildContext context;
  SplashScreenStartUpEvent(this.context);
}
