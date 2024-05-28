import 'package:either_dart/either.dart';
import 'package:weather_application/data/entity/forecast_entity.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/domain/base_data_source/base_remote_datasource.dart';
import 'package:weather_application/domain/base_repository/base_repository.dart';

class WeatherRepository implements BaseRemoteRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Either<String, WeatherModel>> getWeatherForCurrentCity(
      String cityName) async {
    final currentCityWeatherResult =
        await baseRemoteDataSource.getWeatherInfoForCurrentCity(cityName);
    return currentCityWeatherResult;
  }

  @override
  Future<Either<String, ForecastModel>> getForecast(String cityName) async {
    final forecastResult = await baseRemoteDataSource.getForecast(cityName);
    return forecastResult;
  }
}
