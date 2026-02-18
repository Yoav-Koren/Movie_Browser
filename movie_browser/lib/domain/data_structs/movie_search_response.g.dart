// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieSearchResponseAdapter extends TypeAdapter<MovieSearchResponse> {
  @override
  final int typeId = 0;

  @override
  MovieSearchResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieSearchResponse(
      title: fields[0] as String,
      year: fields[1] as String,
      releaseDate: fields[2] as String,
      runtime: fields[3] as String,
      rating: fields[4] as String,
      genre: fields[5] as String,
      director: fields[6] as String,
      writers: fields[7] as String,
      actors: fields[8] as String,
      plot: fields[9] as String,
      language: fields[10] as String,
      country: fields[11] as String,
      awards: fields[12] as String,
      posterURL: fields[13] as String,
      ratings: (fields[14] as List).cast<MovieRatings>(),
      metascore: fields[15] as String,
      imdbRating: fields[16] as String,
      imdbVotes: fields[17] as String,
      imdbID: fields[18] as String,
      type: fields[19] as MediaType,
      dvd: fields[20] as String,
      boxOffice: fields[21] as String,
      production: fields[22] as String,
      websiteURL: fields[23] as String,
      isFavorite: fields[24] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MovieSearchResponse obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.runtime)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.director)
      ..writeByte(7)
      ..write(obj.writers)
      ..writeByte(8)
      ..write(obj.actors)
      ..writeByte(9)
      ..write(obj.plot)
      ..writeByte(10)
      ..write(obj.language)
      ..writeByte(11)
      ..write(obj.country)
      ..writeByte(12)
      ..write(obj.awards)
      ..writeByte(13)
      ..write(obj.posterURL)
      ..writeByte(14)
      ..write(obj.ratings)
      ..writeByte(15)
      ..write(obj.metascore)
      ..writeByte(16)
      ..write(obj.imdbRating)
      ..writeByte(17)
      ..write(obj.imdbVotes)
      ..writeByte(18)
      ..write(obj.imdbID)
      ..writeByte(19)
      ..write(obj.type)
      ..writeByte(20)
      ..write(obj.dvd)
      ..writeByte(21)
      ..write(obj.boxOffice)
      ..writeByte(22)
      ..write(obj.production)
      ..writeByte(23)
      ..write(obj.websiteURL)
      ..writeByte(24)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieSearchResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
