import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themperatureProvider = StateProvider<ThemperatureData>((ref) => ThemperatureData.celsius);

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

enum ThemperatureData {
  celsius,
  fahrenheit
}