import 'package:flutter/material.dart';

class ColorApp {
  static Color transParentColor = Colors.transparent;
  static Color whiteColorWOpacity = const Color(0xffFFFFFF).withOpacity(0.25);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color colorForCard = const Color(0xffECECEC);
  static Color russianViolateColor= const Color(0xff391A49);
  static Color cardB=const Color(0xffaaa5a5).withOpacity(0.7);
  static LinearGradient linearGradientBackground = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1121, 0.3242, 0.5592, 0.6939, 0.8957],
    colors: [
      Color(0xff391A49),
      Color(0xff301D5C),
      Color(0xff262171),
      Color(0xff301D5C),
      Color(0xff391A49),
    ],
    transform: GradientRotation(192.33),
  );
  static Color redColor= Colors.redAccent;
  static Color splashButtonColor =const Color(0xffBF360C);
  static Color greyColor = const Color(0xffE6E6FA);
  static Color blackColor =const Color(0xff000000);
  static Color yellowColor = const Color(0xffFFFF00);


  static Color primaryColor = const Color(0xff6b9dfc);
  static Color secondaryColor = const Color(0xffa1c6fd);
  static Color tertiaryColor = const Color(0xff205cf1);
  static Color blackColor2 = const Color(0xff1a1d26);

  static Color greyColor2 = const Color(0xffd9dadb);

  static Shader shader = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static LinearGradient linearGradientBlue =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff6b9dfc), Color(0xff205cf1)],
      stops: [0.0,1.0]
  );
  static LinearGradient linearGradientPurple =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff51087E), Color(0xff6C0BA9)],
      stops: [0.0,1.0]
  );
}
