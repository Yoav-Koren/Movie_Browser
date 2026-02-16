part of 'pagination_control_bloc.dart';

@immutable
abstract class PaginationControlEvent extends Equatable {
  const PaginationControlEvent();

  @override
  List<Object> get props => [];
}

@immutable
class PaginationNextPageEvent extends PaginationControlEvent {
  const PaginationNextPageEvent();

  @override
  List<Object> get props => [];
}

@immutable
class PaginationBackPageEvent extends PaginationControlEvent {
  const PaginationBackPageEvent();

  @override
  List<Object> get props => [];
}
