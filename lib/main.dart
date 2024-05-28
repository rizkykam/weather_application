import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/bloc/weather_bloc.dart';
import 'package:weather_application/const/applocator/service_locator.dart';
import 'package:weather_application/const/utils/weather_string.dart';
import 'package:weather_application/presentation/controllers/conectivity/connectivity_bloc.dart';
import 'package:weather_application/presentation/controllers/forecast_controller/forecast_controller_bloc.dart';
import 'package:weather_application/presentation/controllers/weather_controller/weather_controller_bloc.dart';
import 'bloc/weather_bloc.dart';
import 'package:weather_application/routes/weather_routes.dart';
import 'package:weather_application/const/utils/theme.dart';

import 'package:weather_application/screens/home_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    WeatherControllerBloc(appServiceLocator()),
              ),
              BlocProvider(
                  create: (context) =>
                    ForecastControllerBloc(appServiceLocator())),
              BlocProvider(create: (context) => ConnectivityBloc())
            ],
            child: MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              title: WeatherAppString.title,
              themeMode: ThemeMode.system,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: WeatherRoutes.homePageRoute,
            ),
          );
        }
    );

    // return MaterialApp(
		// 	debugShowCheckedModeBanner: false,
    //   home: FutureBuilder(
		// 		future: _determinePosition(),
    //     builder: (context, snap) {
		// 			if(snap.hasData) {
		// 				return BlocProvider<WeatherBloc>(
		// 					create: (context) => WeatherBloc()..add(
		// 						FetchWeather(snap.data as Position)
		// 					),
		// 					child: const HomeScreen(),
		// 				);
		// 			} else {
    //         print(snap.error);
		// 				return const Scaffold(
		// 					body: Center(
		// 						child: CircularProgressIndicator(),
		// 					),
		// 				);
		// 			}
    //     }
    //   )
    // );
  }
}


// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the 
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale 
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately. 
//     return Future.error(
//       'Location permissions are permanently denied, we cannot request permissions.');
//   } 

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }


