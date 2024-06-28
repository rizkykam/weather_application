import 'package:flutter/material.dart';
import 'package:weather_application/presentation/screens/weather_home_page.dart';
import 'package:weather_application/screens/favorite_screen.dart';

class WeatherRoutes {
  static const String homePageRoute = '/home';
  static const String favoritePageRoute = '/favorites';
}

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case WeatherRoutes.homePageRoute:
        return MaterialPageRoute(builder: (_) => const WeatherHomePage());
      case WeatherRoutes.favoritePageRoute:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen(),);
      default:
        return unDefinedRoute();
    }
  }

  /// route is not found show error
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('404'),
              ),
              body: const Center(
                child: Text('Not Found'),
              ),
            ));
  }
}
