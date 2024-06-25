import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_application/data/entity/favorite_entity.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/db/data/repository.dart';
import 'package:weather_application/db/domain/weather_entity.dart';

final themperatureProvider = StateProvider<ThemperatureData>((ref) => ThemperatureData.celsius);

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

enum ThemperatureData {
  celsius,
  fahrenheit
}

final isFavoriteProvider = StateProvider<bool>((ref) => false);

final loadFavoriteProvider = FutureProvider.autoDispose<List<FavoritesEntity>>((ref) async {
  final weatherValues = await ref.watch(dbRepositoryProvider).getList();
  
  return List.generate(weatherValues.length, (i) => FavoritesEntity.fromDb(weatherValues[i]));
});

final saveFavoriteProvider = FutureProvider.autoDispose.family<void, WeatherModel>((ref, args) async {
  final repository = ref.watch(dbRepositoryProvider);

  await repository.insert(WeatherEntity.fromModel(args));
  ref.watch(isFavoriteProvider.notifier).state = true;
});

final removeFavoriteProvider = FutureProvider.autoDispose.family<void, num>((ref, args) async {
  final repository = ref.watch(dbRepositoryProvider);

  await repository.delete(args);
  ref.watch(isFavoriteProvider.notifier).state = false;
});

final checkFavoriteProvider = FutureProvider.autoDispose.family<void, num>((ref, args) async {
  final repository = ref.watch(dbRepositoryProvider);
  ref.watch(isFavoriteProvider.notifier).state = await repository.hasSaved(args);
});