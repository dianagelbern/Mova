import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color secondaryColor = Color(0xFFE21221);


  static const double textSizeGigant = 25.0;
  static const double textSizeBig = 30.0;
  static const double textSizeMedium = 20.0;
  static const double textSizeSmall = 13.0;
  static const double textSizeMin = 10.25;
  static const double textSizeTitle = 14.0;

  static TextStyle get textTitle => GoogleFonts.getFont('Roboto',
          color: Styles.primaryColor,
          fontSize: textSizeGigant,
          fontWeight: FontWeight.w600,);

  static TextStyle get textRegular => GoogleFonts.getFont('Roboto',
      color: Styles.primaryColor, fontSize: textSizeSmall);

  static TextStyle get textSubtitle => GoogleFonts.getFont('Roboto',
      color: Styles.primaryColor,
      fontSize: textSizeSmall,);

      static TextStyle get textSubtitleBold => GoogleFonts.getFont('Roboto',
      color: Styles.primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: textSizeSmall,);

      static TextStyle get textSubtitleGray => GoogleFonts.getFont('Roboto',
      color: Color.fromARGB(127, 255, 255, 255),
      fontSize: textSizeSmall,);

      static TextStyle get textSubtitleRed => GoogleFonts.getFont('Roboto',
      color: Styles.secondaryColor,
      fontSize: textSizeSmall,);
}