import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  Locale _locale = Locale('en');
  LocalizationBloc() : super(LocalizationState(Locale('en'))) {
    on<LocalizationEvent>((event, emit) {});

    on<ToggleLocale>((event, emit) {
      if (_locale.languageCode == 'en') {
        _locale = Locale('pl');
        emit(LocalizationState(_locale));
      } else {
        _locale = Locale('en');
        emit(LocalizationState(_locale));
      }
    });
  }
}
