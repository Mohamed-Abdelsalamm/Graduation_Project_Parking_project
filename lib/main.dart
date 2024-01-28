import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/core/utils/service_locator.dart';
import 'package:parking/featuers/authentication/data/repo/auth_repo_impl.dart';
import 'package:parking/featuers/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:parking/featuers/nav_bar/presentation/manger/botton_nav_bar_cubit.dart';

import 'core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const ParkingApp());
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => BottomNavigationCubit(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          theme: ThemeData(
            appBarTheme: const AppBarTheme(surfaceTintColor: Colors.white),
            scaffoldBackgroundColor: Colors.grey.shade100,
            textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
          ),
        ),
      ),
    );
  }
}
