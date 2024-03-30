import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color Palette
Color primaryDarkColor = const Color(0xff040C23);
Color appBlue = const Color(0xff4AA8FF);
Color appLightBlue = const Color(0xff749BC2);
Color appOrange = const Color(0xffF8CBA6);
Color appGray = const Color(0xff787A91);

// Text Theme
TextStyle titleStyle = GoogleFonts.poppins(
  fontSize: 28,
  fontWeight: FontWeight.w700,
);

TextStyle subtitleStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: appLightBlue,
);

TextStyle arabicStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  fontFamily: 'Uthmani',
);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  // color: Colors.white,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: appGray,
);

// Themes
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appBlue,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryDarkColor,
  scaffoldBackgroundColor: primaryDarkColor,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryDarkColor,
  ),
  textTheme: const TextTheme(),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xff0174BE),
  ),
);
