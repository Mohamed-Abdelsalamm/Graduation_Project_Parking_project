import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/featuers/authentication/presentation/views/create_new_password_view.dart';
import 'package:parking/featuers/authentication/presentation/views/login_view.dart';
import 'package:parking/featuers/authentication/presentation/views/signup_view.dart';
import 'package:parking/featuers/onboarding/presentation/views/onboarding_view.dart';
import 'package:parking/featuers/parking_history/presentation/views/my_parking_view.dart';

abstract class AppRouter {
  static const kMyParkingView = "/1" /*"/myParkingView"*/;
  static const kOnBoardingView = "/2" /*"/myParkingView"*/;
  static const kLoginView = "/3" /*"/myParkingView"*/;
  static const kSignUpView = "/4" /*"/myParkingView"*/;
  static const kCreateNewPasswordView = "/" /*"/myParkingView"*/;

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kMyParkingView,
        builder: (BuildContext context, GoRouterState state) =>
            const MyParkingView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (BuildContext context, GoRouterState state) =>
            const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpView(),
      ),
      GoRoute(
        path: kCreateNewPasswordView,
        builder: (BuildContext context, GoRouterState state) =>
            const CreateNewPasswordView(),
      ),
    ],
  );
}
