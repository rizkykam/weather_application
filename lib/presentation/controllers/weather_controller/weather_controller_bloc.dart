import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/domain/usecases/weatherapp_usecases.dart';

part 'weather_controller_state.dart';
part 'weather_controller_event.dart';

class WeatherControllerBloc
    extends Bloc<WeatherControllerEvent, WeatherHomeControllerState> {
  final WeatherAppUseCases weatherAppUseCases;

  WeatherControllerBloc(this.weatherAppUseCases)
      : super(WeatherControllerInitial()) {
    on<GetInitialEvent>((event, emit) async {
      emit(WeatherControllerInitial());
    });

    on<GetCurrentCityWeatherInfo>((event, emit) async {
      emit(CurrentCityWeatherInfoLoading());
      final result =
          await weatherAppUseCases.getCurrentCityWeather(event.currentCityName);
      result.fold((left) => emit(CurrentCityWeatherInfoLoadingError(left)),
          (right) => emit(CurrentCityDataLoaded(right)));
    });
  }
}
