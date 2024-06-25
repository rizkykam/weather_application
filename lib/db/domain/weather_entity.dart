import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_application/data/entity/weather_entity.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  final double temp;
  final DateTime date;
  final String icon;
  final num cityId;
  final String name;

  WeatherEntity({required this.temp, required this.date, required this.icon, required this.cityId, required this.name});

  factory WeatherEntity.fromJson(Map<String, dynamic> json) => _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);

  factory WeatherEntity.fromModel(WeatherModel model) {
    return WeatherEntity(temp: model.main.temp.value, date: model.updatedAt, icon: model.weather[0].icon, cityId: model.id, name: model.name);
  }
}