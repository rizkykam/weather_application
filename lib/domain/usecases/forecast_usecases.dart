import 'package:either_dart/either.dart';
import 'package:weather_application/data/entity/forecast_entity.dart';
import 'package:weather_application/domain/base_repository/base_repository.dart';

class ForecastUseCase {
  final BaseRemoteRepository baseRemoteRepository;

  ForecastUseCase(this.baseRemoteRepository);

  Future<Either<String, ForecastModel>> getForecast(String cityName) async {
    return await baseRemoteRepository.getForecast(cityName);
  }
}
