import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_application/db/domain/weather_entity.dart';

part 'favorite_entity.g.dart';

@JsonSerializable()
class FavoritesEntity {
  final double temp;
  final DateTime date;
  final String icon;
  final num cityId;
  final String name;

  FavoritesEntity({required this.temp, required this.date, required this.icon, required this.cityId, required this.name});

  factory FavoritesEntity.fromJson(Map<String, dynamic> json) => _$FavoritesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesEntityToJson(this);

  factory FavoritesEntity.fromDb(WeatherEntity db) {
    return FavoritesEntity(temp: db.temp, date: db.date, icon: db.icon, cityId: db.cityId, name: db.name);
  }
  
}