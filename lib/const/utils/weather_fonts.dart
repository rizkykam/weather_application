import 'package:flutter/material.dart';
import 'package:weather_application/const/utils/weather_font_size.dart';

class WeatherFonts {
  static const String raleway = 'Raleway';
  static TextStyle _baseFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: raleway,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle extraSmall({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: WeatherFontSize.s10,
    );
  }

  static TextStyle small({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: WeatherFontSize.s12,
    );
  }

  static TextStyle medium({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: WeatherFontSize.s16,
    );
  }

  static TextStyle large({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: WeatherFontSize.s24,
    );
  }
}
