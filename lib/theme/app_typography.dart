import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  //Heading 1
  static TextStyle heading1 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  
  //Heading 2
  static TextStyle heading2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  //Body Nromal
  static TextStyle body = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );

  //Body Bold
  static TextStyle bodyBold = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  //Caption
  static TextStyle caption = GoogleFonts.dmSans(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  //Label
  static TextStyle label = GoogleFonts.dmSans(
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );
}