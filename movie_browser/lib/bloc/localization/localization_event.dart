part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();
  @override
  List<Object?> get props => [];
}

class ToggleLocale extends LocalizationEvent {}
