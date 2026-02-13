part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

class NavigateToPageEvent extends BottomNavBarEvent {
  final PageRoutings routePage;
  const NavigateToPageEvent(this.routePage);

  @override
  List<Object> get props => [routePage];
}
