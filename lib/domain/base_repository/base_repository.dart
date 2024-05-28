import 'package:either_dart/either.dart';
import 'package:weather_application/data/entity/forecast_entity.dart';
import 'package:weather_application/data/entity/weather_entity.dart';

abstract class BaseRemoteRepository {
  Future<Either<String, WeatherModel>> getWeatherForCurrentCity(
      String cityName);
  Future<Either<String, ForecastModel>> getForecast(String cityName);
}
