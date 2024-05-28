import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_application/data/entity/weather_entity.dart';
import 'package:weather_application/presentation/commonwidgets/weather_app_bar.dart';
import 'package:weather_application/presentation/screens/reusable_container.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_application/const/color_app.dart';
import 'package:weather_application/const/extension_app.dart';
import 'package:weather_application/const/utils/utils.dart';
import 'package:weather_application/const/utils/weather_fonts.dart';
import 'package:weather_application/const/utils/weather_string.dart';
import 'package:weather_application/const/utils/weather_font_size.dart';
import 'package:weather_application/data/entity/forecast_entity.dart';
import 'package:weather_application/const/resources_app.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:weather_application/presentation/controllers/forecast_controller/forecast_controller_bloc.dart';
import 'package:weather_application/presentation/screens/search_bottom_widget.dart';

class WeatherUIWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherUIWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        color: ColorApp.primaryColor.withOpacity(.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: size.height * .60,
              decoration: BoxDecoration(
                gradient: ColorApp.linearGradientBlue,
                boxShadow: [
                  BoxShadow(
                    color: ColorApp.primaryColor.withOpacity(.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  WeatherAppBar(
                    cityNames: weatherModel.name,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const SearchBottomWidget();
                        },
                      );
                    },
                  ),
                  
                  10.0.sizeHeight,
                  HomeUtils.getWeatherIcon(
                    weatherModel.weather[0].icon) !=
                    WeatherIcons.refresh
                    ? Icon(
                      HomeUtils.getWeatherIcon(
                        weatherModel.weather[0].icon),
                        size: 80.0,
                        color: ColorApp.yellowColor,
                      )
                        : Image.network(
                          HomeUtils.getWeatherIconURL(
                            weatherModel.weather[0].icon),
                            color: ColorApp.yellowColor,
                          ),
                  10.0.sizeHeight,
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                          text:
                              (weatherModel.main.temp.ceil()).toString(),
                          style: WeatherFonts.medium(
                                  fontWeight: FontWeight.w500,
                                  color: ColorApp.whiteColor)
                              .copyWith(fontSize: WeatherFontSize.s40),
                        ),
                        WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(2, -8),
                                child: Row(
                                  children: [
                                    Text(
                                      WeatherAppString.celcius,
                                      style: WeatherFonts.medium(
                                              fontWeight: FontWeight.w500,
                                              color: ColorApp
                                                  .whiteColor)
                                          .copyWith(
                                              fontSize:
                                                  WeatherFontSize.s24),
                                    ),
                                  ],
                                )))
                      ])),
                      // Text(
                      //   WeatherAppString.slash,
                      //   style: WeatherFonts.large(
                      //           fontWeight: FontWeight.w500,
                      //           color: ColorApp.whiteColor)
                      //       .copyWith(fontSize: WeatherFontSize.s40),
                      // ),
                      // RichText(
                      //     text: TextSpan(children: <InlineSpan>[
                      //   TextSpan(
                      //     text:
                      //         (((9 / 5) * weatherModel.main.temp).ceil() +
                      //                 32)
                      //             .toString(),
                      //     style: WeatherFonts.large(
                      //             fontWeight: FontWeight.w500,
                      //             color: ColorApp.whiteColor)
                      //         .copyWith(fontSize: WeatherFontSize.s40),
                      //   ),
                      //   WidgetSpan(
                      //       child: Transform.translate(
                      //           offset: const Offset(2, -8),
                      //           child: Row(
                      //             children: [
                      //               Text(
                      //                 WeatherAppString.farenheit,
                      //                 style: WeatherFonts.medium(
                      //                         fontWeight: FontWeight.w500,
                      //                         color: ColorApp
                      //                             .whiteColor)
                      //                     .copyWith(
                      //                         fontSize:
                      //                             WeatherFontSize.s24),
                      //               ),
                      //             ],
                      //           )))
                      // ]))
                    ],
                  ),

                  Text(
                    weatherModel.weather[0].description
                    .capitalizeFirstLater(),
                    style: WeatherFonts.large(
                      fontWeight: FontWeight.w400,
                      color: ColorApp.whiteColor)
                      .copyWith(fontSize: WeatherFontSize.s30),
                  ),
                  // 10.0.sizeHeight,
                    Center(
                        child: Text(
                      HomeUtils.today(),
                      style: WeatherFonts.medium(
                              fontWeight: FontWeight.w200,
                              color: ColorApp.whiteColor)
                          .copyWith(fontSize: WeatherFontSize.s24),
                    )),
                  2.0.sizeHeight,
                    Center(
                        child: Text(
                      HomeUtils.formatDateTime(
                          weatherModel.updatedAt.toIso8601String()),
                      style: WeatherFonts.large(
                              fontWeight: FontWeight.w300,
                              color:
                                  ColorApp.whiteColor.withOpacity(0.75))
                          .copyWith(
                        fontSize: WeatherFontSize.s16,
                      ),
                    )),

                  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(WeatherAppResources.humidtyIcon, width: 30.0, height: 30.0,),
                                  3.0.sizeHeight,
                                  Text(
                                    WeatherAppString.humidity,
                                    style: WeatherFonts.large(
                                            fontWeight: FontWeight.w500,
                                            color: ColorApp.whiteColor)
                                        .copyWith(
                                            fontSize: WeatherFontSize.s14),
                                  ),
                                  3.0.sizeHeight,
                                  Text(
                                    "${weatherModel.main.humidity} ${WeatherAppString.percent}",
                                    style: WeatherFonts.large(
                                            fontWeight: FontWeight.w500,
                                            color: ColorApp.whiteColor)
                                        .copyWith(
                                            fontSize: WeatherFontSize.s14),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image(
                                      image: Svg(WeatherAppResources.windIcon)),
                                  3.0.sizeHeight,
                                  Text(
                                    WeatherAppString.wind,
                                    style: WeatherFonts.large(
                                            fontWeight: FontWeight.w500,
                                            color: ColorApp.whiteColor)
                                        .copyWith(
                                            fontSize: WeatherFontSize.s14),
                                  ),
                                  3.0.sizeHeight,
                                  Text(
                                    "${weatherModel.wind.speed} ${WeatherAppString.kmh}",
                                    style: WeatherFonts.large(
                                            fontWeight: FontWeight.w500,
                                            color: ColorApp.whiteColor)
                                        .copyWith(
                                            fontSize: WeatherFontSize.s14),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image(
                                      image:
                                          Svg(WeatherAppResources.feelsLike)),
                                  3.0.sizeHeight,
                                  Text(
                                    WeatherAppString.feelsLike,
                                    style: WeatherFonts.large(
                                            fontWeight: FontWeight.w500,
                                            color: ColorApp.whiteColor)
                                        .copyWith(
                                            fontSize: WeatherFontSize.s14),
                                  ),
                                  3.0.sizeHeight,
                                  Text(
                                    weatherModel.main.feelsLike
                                        .ceil()
                                        .toString(),
                                    style: WeatherFonts.large(
                                            fontWeight: FontWeight.w500,
                                            color: ColorApp.whiteColor)
                                        .copyWith(
                                            fontSize: WeatherFontSize.s14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),

          BlocBuilder<ForecastControllerBloc, ForecastControllerState>(
                builder: (context, states) {
              if (states is ForecastLoaded) {
                List<ListElement> data = [];
                data.add(states.foreCastModel.list[0]);
                data.add(states.foreCastModel.list[1]);
                data.add(states.foreCastModel.list[2]);
                data.add(states.foreCastModel.list[3]);
                List<String> dayNext = HomeUtils.getNextFiveDays();
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 3, right: 3),
                  child: Center(
                    child: SizedBox(
                      height: 220.h,
                      child: GlassContainer(
                        color: ColorApp.primaryColor.withOpacity(.9),
                        borderRadius: BorderRadius.circular(16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(data.length, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 7.w, right: 7.w, top: 20.h),
                                  child: NextWeekCard(
                                      daysOfWeek: dayNext[index],
                                      forecastModel: data[index]),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );


              }
              return Container();
            })

          ],
          
        ),
      ),
    );
  }
}
