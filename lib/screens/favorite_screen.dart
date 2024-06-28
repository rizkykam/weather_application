import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:weather_application/application/provider.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/presentation/screens/empty_widget.dart';
import 'package:weather_application/presentation/screens/loading_widget.dart';
import 'package:weather_application/presentation/screens/error_widget.dart';

class FavoriteScreen extends ConsumerWidget {

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final favoritesValues = ref.watch(loadFavoriteProvider);
    final themperatureRef = ref.watch(themperatureProvider);
    final Logger log = Logger('FavoriteScreen');
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: favoritesValues.when(
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => ErrorsWidget(errorMessage: error.toString(), onRetry: () {
          // ignore: unused_result
          ref.refresh(loadFavoriteProvider);
        }),
        data: (data) {
          log.info('success received data: ${data.length}');
          if (data.isEmpty) return const EmptyWidget('No Items found.');
          return Container(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                final fav = data[i];
                final themperature = Themperature(value: fav.temp);
                return FavoriteItemWidget(
                  id: fav.cityId,
                  name: fav.name,
                  temperature: themperatureRef == ThemperatureData.celsius ? themperature.celcius : themperature.fahrenheit,
                  onRemove: (id) {
                    ref.watch(removeFavoriteProvider(id));
                    ref.refresh(loadFavoriteProvider);
                    log.info('${fav.name} is removed');
                  },
                );
              }
            ),
          );
        }
      )
    );
  }
}

class FavoriteItemWidget extends StatelessWidget {

  final num id;
  final String name;
  final String temperature;
  final void Function(num) onRemove;

  const FavoriteItemWidget({super.key, required this.name, required this.temperature, required this.onRemove, required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: theme.textTheme.labelMedium,),
                Text(temperature,style: theme.textTheme.labelSmall,)
              ],
            ),
            Center(
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => onRemove(id),
                tooltip: 'remove $name',
                color: Colors.red,
                iconSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }

}