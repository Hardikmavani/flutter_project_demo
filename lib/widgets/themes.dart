import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      textTheme: Theme.of(context).textTheme,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      textTheme: Theme.of(context).textTheme,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray800;

  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
