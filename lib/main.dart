import 'package:flutter/material.dart';
import 'featuers/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const ParkingApp());
}


class ParkingApp extends StatelessWidget {
  const ParkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}


