import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color background = const Color(0xFFE2E2FF);
  static Color primary = const Color(0xFF000633);
  static Color accent = const Color(0xFF0065FF);
  static List<Color> cardColorOptions = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.bold
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16.0,
    fontWeight: FontWeight.normal
  );

  static TextStyle date = GoogleFonts.nunito(
    fontSize: 13.0,
    fontWeight: FontWeight.w500
  );
  
}
