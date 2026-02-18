import 'package:hive/hive.dart';

part 'media_type.g.dart';

@HiveType(typeId: 2)
enum MediaType {
  @HiveField(0)
  movie,

  @HiveField(1)
  series,

  @HiveField(2)
  episode,

  @HiveField(3)
  game,
}
