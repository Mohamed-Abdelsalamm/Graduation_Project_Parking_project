import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/featuers/authentication/presentation/views/login_view.dart';
import 'package:parking/featuers/book_mark/presintation/view/my_book_mark_view.dart';
import 'package:parking/featuers/notification/presentation/view/notification_view.dart';
import 'package:parking/featuers/onboarding/presentation/views/onboarding_view.dart';
import 'package:parking/featuers/parking_history/presentation/views/my_parking_view.dart';
import 'package:parking/featuers/search/presintation/view/search_view.dart';

abstract class AppRouter {
  static const kMyParkingView = "/1" /*"/myParkingView"*/;
  static const kOnBoardingView = "/2" /*"/myParkingView"*/;
  static const kLoginView = "/3" /*"/myParkingView"*/;
  static const kMyBookMarkView = "/4" /*"/myParkingView"*/;
  static const kNotificationView = "/5" /*"/notificationView"*/;
  static const kSearchView = "/" /*"/searchView"*/;

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
        path: kMyBookMarkView,
        builder: (BuildContext context, GoRouterState state) =>
        const MyBookMarkView(),
      ),
      GoRoute(
        path: kNotificationView,
        builder: (BuildContext context, GoRouterState state) =>
        const NotificationView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) =>
        const SearchView(),
      ),
    ],
  );
}
