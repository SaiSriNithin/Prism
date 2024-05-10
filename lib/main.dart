import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_prism/navbar.dart';
import 'package:new_prism/screens/splash_and_login_screens/onboarding_scrrens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

var greenColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 17, 79, 90),
);
var goldColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 251, 171, 58),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool onboarding = prefs.getBool("onboarding") ?? false;
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatefulWidget {
  final bool onboarding;

  const MyApp({super.key, this.onboarding = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 17, 79, 90),
          onPrimary: Color.fromARGB(150, 17, 79, 90),
          secondary: Color.fromARGB(255, 251, 171, 58),
          onSecondary: Color.fromARGB(150, 251, 171, 58),
          background: Color.fromARGB(255, 247, 248, 251),
          onBackground: Color.fromARGB(110, 247, 248, 251),
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
          bodyMedium: GoogleFonts.merriweather(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),

      //this is test tharak
      // home: Homescreen(),
      home: widget.onboarding ? const Navbar1() : const OnboardingScreen(),
      //home: Community(),
      // go to hell
    );
  }
}
