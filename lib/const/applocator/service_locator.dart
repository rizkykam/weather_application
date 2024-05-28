import 'package:get_it/get_it.dart';
import 'package:weather_application/data/data_source/remote_data_source.dart';
import 'package:weather_application/data/remote_repository/remote_repository.dart';
import 'package:weather_application/domain/base_data_source/base_remote_datasource.dart';
import 'package:weather_application/domain/base_repository/base_repository.dart';
import 'package:weather_application/domain/usecases/forecast_usecases.dart';
import 'package:weather_application/domain/usecases/weatherapp_usecases.dart';
import 'package:weather_application/presentation/controllers/weather_controller/weather_controller_bloc.dart';

GetIt appServiceLocator = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    appServiceLocator
        .registerFactory(() => WeatherControllerBloc(appServiceLocator()));
    appServiceLocator
        .registerLazySingleton(() => WeatherAppUseCases(appServiceLocator()));
    appServiceLocator
        .registerLazySingleton(() => ForecastUseCase(appServiceLocator()));
    appServiceLocator.registerLazySingleton<BaseRemoteRepository>(
        () => WeatherRepository(appServiceLocator()));
    appServiceLocator
        .registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
