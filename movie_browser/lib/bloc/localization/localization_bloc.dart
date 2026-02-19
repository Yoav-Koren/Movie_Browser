import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
import 'package:movie_browser/consts/const_strings.dart';
part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  Locale _locale = Locale(ConstString.englishLocale);
  LocalizationBloc()
      : super(LocalizationState(Locale(ConstString.englishLocale))) {
    on<LocalizationEvent>((event, emit) {});

    on<ToggleLocale>((event, emit) {
      if (_locale.languageCode == ConstString.englishLocale) {
        _locale = Locale(ConstString.polishLocale);
        emit(LocalizationState(_locale));
      } else {
        _locale = Locale(ConstString.englishLocale);
        emit(LocalizationState(_locale));
      }
    });
  }
}
