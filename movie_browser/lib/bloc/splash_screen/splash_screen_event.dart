part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];
}

@immutable
class SplashScreenStartUpEvent extends SplashScreenEvent {
  final BuildContext context;
  const SplashScreenStartUpEvent(this.context);

  @override
  List<Object> get props => [context];
}
