import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_prism/gg.dart';
import 'package:new_prism/navbar.dart';

var greenColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 17, 79, 90),
);
var goldColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 251, 171, 58),
);

void main() {
  runApp( MaterialApp(

    theme: ThemeData(
    useMaterial3: true,


    colorScheme:const ColorScheme(
      primary: Color.fromARGB(255, 17, 79, 90), 
      onPrimary: Color.fromARGB(150, 17, 79, 90),

      secondary: Color.fromARGB(255, 251, 171, 58),
      onSecondary: Color.fromARGB(150, 251, 171, 58), 

      background: Color.fromARGB(255, 247, 248, 251),
      onBackground: Color.fromARGB(255, 247, 248, 251),

      error: Colors.red,
      onError: Colors.red,

      surface: Color.fromARGB(255, 255, 255, 255), 
      onSurface: Color.fromARGB(255, 255, 255, 255),

      brightness: Brightness.light,
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  ),




    //this is test tharak
    // home: Homescreen(),
    home: Navbar1(),
    //home: Community(),
    // go to hell
  ));
}
