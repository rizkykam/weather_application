import 'package:flutter/material.dart';
import 'package:weather_application/const/color_app.dart';
import 'package:weather_application/const/utils/weather_font_size.dart';
import 'package:weather_application/const/utils/weather_fonts.dart';

class WeatherAppBar extends StatelessWidget {
  final String cityNames;
  final Function onTap;

  const WeatherAppBar({
    super.key,
    required this.cityNames,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorApp.transParentColor,
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
}
