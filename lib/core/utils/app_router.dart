
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/featuers/parking_history/presentation/views/my_parking_view.dart';


abstract class AppRouter{

  static const kMyParkingView = "/"/*"/myParkingView"*/;


  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kMyParkingView,
        builder: (BuildContext context, GoRouterState state) => const MyParkingView(),
      ),
    ],
  );

}
