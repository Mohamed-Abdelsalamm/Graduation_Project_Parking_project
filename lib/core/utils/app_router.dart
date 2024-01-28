import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/featuers/authentication/presentation/views/create_new_password_view.dart';
import 'package:parking/featuers/authentication/presentation/views/login_view.dart';
import 'package:parking/featuers/authentication/presentation/views/signup_view.dart';
import 'package:parking/featuers/book_mark/presentation/view/my_book_mark_view.dart';
import 'package:parking/featuers/garage_details/presentation/views/garage_view.dart';
import 'package:parking/featuers/home/data/models/parking_garage_model.dart';
import 'package:parking/featuers/home/presentation/views/home_view.dart';
import 'package:parking/featuers/nav_bar/presentation/view/bottom_nav_bar.dart';
import 'package:parking/featuers/notification/presentation/view/notification_view.dart';
import 'package:parking/featuers/onboarding/presentation/views/onboarding_view.dart';
import 'package:parking/featuers/parking_history/presentation/views/my_parking_view.dart';
import 'package:parking/featuers/profile/presentation/view/edit_profile_view.dart';
import 'package:parking/featuers/profile/presentation/view/profile_view.dart';
import 'package:parking/featuers/profile/presentation/views/user_profile_view.dart';
import 'package:parking/featuers/search/presentation/view/search_view.dart';

abstract class AppRouter {
  static const kMyParkingView = "/myParkingView";
  static const kOnBoardingView = "/";
  static const kLoginView = "/kLoginView";
  static const kMyBookMarkView = "/myBookMarkView";
  static const kNotificationView = "/notificationView";
  static const kSearchView = "/searchView";
  static const kProfileView = "/profileView";
  static const kEditProfileView = "/editProfileView";
  static const kSignUpView = "/signUpView";
  static const kCreateNewPasswordView = "/createNewPasswordView";
  static const kHomeView = "/HomeView";
  static const kGarageView = "/garageView";
  static const kBottomNavBar = "/kBottomNavBar";

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
        builder: (BuildContext context, GoRouterState state) => LoginView(),
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
      GoRoute(
        path: kProfileView,
        builder: (BuildContext context, GoRouterState state) =>
            const ProfileView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (BuildContext context, GoRouterState state) =>
            const EditProfileView(),
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
      GoRoute(
        path: kProfileView,
        builder: (BuildContext context, GoRouterState state) =>
            const UserProfileView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) => HomeView(),
      ),
      GoRoute(
        path: kGarageView,
        builder: (BuildContext context, GoRouterState state) =>
            GarageView(garageModel: state.extra as ParkingGarage),
      ),
      GoRoute(
        path: kBottomNavBar,
        builder: (BuildContext context, GoRouterState state) =>
            const BottomNavBarView(),
      ),
    ],
  );
}
