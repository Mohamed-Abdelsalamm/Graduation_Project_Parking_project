import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ParkingApp());
}


class ParkingApp extends StatelessWidget {
  const ParkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          textTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme
          ),
        ),
      ),
    );
  }
}


