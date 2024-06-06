import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/presentation/controllers/conectivity/connectivity_bloc.dart';
import 'package:weather_application/presentation/controllers/weather_controller/weather_controller_bloc.dart';
import 'package:weather_application/presentation/screens/weather_widget.dart';
import 'package:weather_application/const/utils/utils.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHomePage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final GlobalKey<State> permissionDialogKey = GlobalKey<State>();
  bool isLocationServiceInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initLocationService();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return BlocConsumer<WeatherControllerBloc,
              WeatherHomeControllerState>(
            buildWhen: (previous, current) {
              return (previous is CurrentCityWeatherInfoLoading &&
                      current is CurrentCityDataLoaded) ||
                  (current is CurrentCityDataLoaded &&
                      previous is CurrentCityDataLoaded);
            },
            listenWhen: (previous, current) {
              return previous != current;
            },
            builder: (context, state) {
              log('builder home page: ${state.toString()}');
              if (state is CurrentCityDataLoaded) {
                WeatherModel weatherCityModel = state.currentCityData;
                weatherCityModel.isCurrentCity = true;
                return WeatherUIWidget(
                  weatherModel: weatherCityModel,
                );
              }
              return Container();
            },
            listener: (BuildContext context, WeatherHomeControllerState state) {
              if (state is CurrentCityWeatherInfoLoadingError) {
                log(state.errorMessage);
              }
            },
          );
        } else if (state is NotConnectedState) {
          log("Not connected");
        }
        return Container();
      },
    ));
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (!isLocationServiceInitialized) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission != LocationPermission.denied) {
          await initLocationService();
          isLocationServiceInitialized = true;
        } else {
          await initLocationService();
        }
      }
    }
  }

  Future<void> initLocationService() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      if (mounted) {
        await HomeUtils.showLocationServiceDialog(context, mounted);
      }
    } else {
      dismissPermissionDialog();
      await handleLocationPermission();
    }
  }

  Future<void> handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            HomeUtils.permissionDialog(
                context, permissionDialogKey, mounted, false, false);
          }
          return;
        } else if (permission == LocationPermission.deniedForever) {
          if (mounted) {
            await openAppSettings();
          }
          return;
        }
        break;
      case LocationPermission.deniedForever:
        if (mounted) {
          await openAppSettings();
        }
        return;
      default:
        break;
    }
    if (mounted) {
      isLocationServiceInitialized = true;
      await HomeUtils.getPosition(
          context, mounted, permissionDialogKey, false, false);
    }
  }

  void dismissPermissionDialog() {
    if (permissionDialogKey.currentState != null &&
        permissionDialogKey.currentContext != null) {
      Navigator.of(permissionDialogKey.currentContext!).pop();
    }
  }
}
