import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:weather_application/application/provider.dart';
import 'package:weather_application/const/color_app.dart';
import 'package:weather_application/const/extension_app.dart';
import 'package:weather_application/const/resources_app.dart';
import 'package:weather_application/const/utils/utils.dart';
import 'package:weather_application/const/utils/weather_string.dart';
import 'package:weather_application/const/utils/weather_font_size.dart';
import 'package:weather_application/data/entity/forecast_entity.dart';

import 'package:weather_application/const/utils/weather_fonts.dart';

class NextWeekCard extends ConsumerWidget {
  final String daysOfWeek;
  final ListElement forecastModel;

  const NextWeekCard(
      {super.key, required this.daysOfWeek, required this.forecastModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themperatureRef = ref.watch(themperatureProvider);

    return Column(
      children: [
        Text(
          daysOfWeek,
          style: WeatherFonts.large()
              .copyWith(
                  color: ColorApp.whiteColor,
                  fontWeight: FontWeight.w400)
              .copyWith(fontSize: WeatherFontSize.s14),
        ),
        Text(
          forecastModel.weather[0].description!,
          style: WeatherFonts.small()
              .copyWith(
                  color: ColorApp.whiteColor,
                  fontWeight: FontWeight.w300)
              .copyWith(fontSize: WeatherFontSize.s14),
        ),
        SizedBox(
          height: 5.h,
        ),
        Image.network(
          HomeUtils.getWeatherIconURL(forecastModel.weather[0].icon!),
          color: ColorApp.yellowColor,
        ),

        /// temp
        Text(
          // "${(forecastModel.main!.temp! / 10).ceil()} ${WeatherAppString.celcius}",
          themperatureRef == ThemperatureData.celsius ? forecastModel.main!.temp.celcius : forecastModel.main!.temp.fahrenheit,
          style: WeatherFonts.large()
              .copyWith(
                  color: ColorApp.whiteColor,
                  fontWeight: FontWeight.w400)
              .copyWith(fontSize: WeatherFontSize.s16),
        ),
        SizedBox(
          height: 5.h,
        ),

        // wind speed
        Row(
          children: [
            Text(
              forecastModel.wind!.speed!.ceil().toString(),
              style: WeatherFonts.large()
                  .copyWith(
                      color: ColorApp.whiteColor,
                      fontWeight: FontWeight.w400)
                  .copyWith(fontSize: WeatherFontSize.s10),
            ),
            3.0.sizeWidth,
            Image(
              image: Svg(WeatherAppResources.windIcon),
              width: 10,
              height: 10,
            )
          ],
        ),

        Text(
          WeatherAppString.kmh,
          style: WeatherFonts.large()
              .copyWith(
                  color: ColorApp.whiteColor,
                  fontWeight: FontWeight.w400)
              .copyWith(fontSize: WeatherFontSize.s10),
        ),
      ],
    );
  }
}
