import 'package:flutter/material.dart';

// ThemeData theme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: appBarTheme(),
//     fontFamily: 'Poppins',
//   );
// }

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0Xff8B8B8B)),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
  );
}

// Light Theme
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  // Define other properties like textTheme, appBarTheme, etc.
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  // Define other properties like textTheme, appBarTheme, etc.
);