import 'package:either_dart/either.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/domain/base_repository/base_repository.dart';

class WeatherAppUseCases {
  final BaseRemoteRepository baseWeatherRepository;

  WeatherAppUseCases(this.baseWeatherRepository);

  Future<Either<String, WeatherModel>> getCurrentCityWeather(
      String cityName) async {
    return await baseWeatherRepository.getWeatherForCurrentCity(cityName);
  }
}
