part of 'bottom_nav_bar_bloc.dart';

@immutable
class BottomNavBarState extends Equatable {
  final PageRoutings currentPage;

  const BottomNavBarState({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
