import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {

  static TextStyle get mainTextStyle => GoogleFonts.bebasNeue(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 60,
  );

  static TextStyle get bodyTextStyle => GoogleFonts.bebasNeue(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 30,
  );

  static TextStyle get quoteTextStyle => GoogleFonts.bebasNeue(
    fontSize: 18,
  );

  static TextStyle get quoteSecondTextStyle => GoogleFonts.bebasNeue(
    fontSize: 16,
  );

}