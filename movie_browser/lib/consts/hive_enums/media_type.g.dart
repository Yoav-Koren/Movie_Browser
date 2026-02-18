// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaTypeAdapter extends TypeAdapter<MediaType> {
  @override
  final int typeId = 2;

  @override
  MediaType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MediaType.movie;
      case 1:
        return MediaType.series;
      case 2:
        return MediaType.episode;
      case 3:
        return MediaType.game;
      default:
        return MediaType.movie;
    }
  }

  @override
  void write(BinaryWriter writer, MediaType obj) {
    switch (obj) {
      case MediaType.movie:
        writer.writeByte(0);
        break;
      case MediaType.series:
        writer.writeByte(1);
        break;
      case MediaType.episode:
        writer.writeByte(2);
        break;
      case MediaType.game:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
