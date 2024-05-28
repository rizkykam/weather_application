part of 'weather_controller_bloc.dart';

// abstract class WeatherHomeControllerState extends Equatable {
//   const WeatherHomeControllerState();
// }

// class WeatherControllerInitial extends WeatherHomeControllerState {
//   @override
//   List<Object> get props => [];
// }

// class CurrentCityWeatherInfoLoading extends WeatherHomeControllerState {
//   @override
//   List<Object?> get props => [];
// }

// class CurrentCityWeatherInfoLoadingError extends WeatherHomeControllerState {
//   final String errorMessage;
//   const CurrentCityWeatherInfoLoadingError(this.errorMessage);
//   @override
  
//   List<Object?> get props => [errorMessage];
// }

// /// get current city data
// class CurrentCityDataLoaded extends WeatherHomeControllerState {
//   final WeatherModel currentCityData;
//   const CurrentCityDataLoaded(this.currentCityData);
//   @override
  
//   List<Object?> get props => [currentCityData];
// }

// import 'package:equatable/equatable.dart';

// part 'weather_controller_bloc.dart';

abstract class WeatherHomeControllerState extends Equatable {
  const WeatherHomeControllerState();
}

class WeatherControllerInitial extends WeatherHomeControllerState {
  @override
  List<Object> get props => [];
}

class CurrentCityWeatherInfoLoading extends WeatherHomeControllerState {
  @override
  List<Object?> get props => [];
}

class CurrentCityWeatherInfoLoadingError extends WeatherHomeControllerState {
  final String errorMessage;

  const CurrentCityWeatherInfoLoadingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() => 'CurrentCityWeatherInfoLoadingError { errorMessage: $errorMessage }';
}

class CurrentCityDataLoaded extends WeatherHomeControllerState {
  final WeatherModel currentCityData;

  const CurrentCityDataLoaded(this.currentCityData);

  @override
  List<Object?> get props => [currentCityData];

  @override
  String toString() => 'CurrentCityDataLoaded { currentCityData: $currentCityData }';
}