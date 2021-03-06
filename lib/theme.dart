import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme(
  primary: Color(0xFF0A1362),
  secondary: Color(0xFF5C3007),
  primaryVariant: Color(0xFF232D83),
  secondaryVariant: Color(0xFF754515),
  surface: Colors.white,
  background: Color(0xE6E7F2),
  error: Color(0xD50000),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onError: Colors.white,
  onBackground: Colors.black,
  brightness: Brightness.light,
);

final textTheme = TextTheme(
  headline1: GoogleFonts.cormorantUnicase(
    fontSize: 109,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.cormorantUnicase(
    fontSize: 68,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.cormorantUnicase(
    fontSize: 55,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.cormorantUnicase(
    fontSize: 39,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.cormorantUnicase(
    fontSize: 27,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.cormorantUnicase(
    fontSize: 23,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.cormorantUnicase(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.cormorantUnicase(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
