import 'package:either_dart/either.dart';
import 'package:weather_application/data/entity/forecast_entity.dart';
import 'package:weather_application/data/entity/weather_entity.dart';

abstract class BaseRemoteDataSource {
  Future<Either<String, WeatherModel>> getWeatherInfoForCurrentCity(
      String cityName);

  Future<Either<String, ForecastModel>> getForecast(String cityName);
}
