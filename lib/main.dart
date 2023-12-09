import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'featuers/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const ParkingApp());
}


class ParkingApp extends StatelessWidget {
  const ParkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: const SplashScreen(),
    );
  }
}


