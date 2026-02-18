// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_ratings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieRatingsAdapter extends TypeAdapter<MovieRatings> {
  @override
  final int typeId = 1;

  @override
  MovieRatings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieRatings(
      source: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieRatings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieRatingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
