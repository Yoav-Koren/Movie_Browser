import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class NewSearchTermEvent extends Equatable {
  final String search;
  const NewSearchTermEvent(this.search);

  @override
  List<Object?> get props => [search];
}
