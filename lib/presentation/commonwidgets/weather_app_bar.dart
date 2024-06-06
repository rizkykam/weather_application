import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_application/const/color_app.dart';
import 'package:weather_application/const/utils/weather_font_size.dart';
import 'package:weather_application/const/utils/weather_fonts.dart';

class WeatherAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String cityNames;
  final Function onTap;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WeatherAppBar({
    super.key,
    required this.cityNames,
    required this.onTap, required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: ColorApp.primaryColor,
      title: Text(
        cityNames,
        style: WeatherFonts.medium(
                fontWeight: FontWeight.w400, color: ColorApp.whiteColor)
            .copyWith(fontSize: WeatherFontSize.s18),
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: GestureDetector(
              onTap: () {
                onTap.call();
              },
              child: Icon(Icons.search, color: ColorApp.whiteColor)),
        )
      ], // Removes shadow
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
