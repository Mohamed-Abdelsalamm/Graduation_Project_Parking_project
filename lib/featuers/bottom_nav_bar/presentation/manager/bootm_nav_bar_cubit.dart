import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking/featuers/book_mark/presentation/view/my_book_mark_view.dart';
import 'package:parking/featuers/bottom_nav_bar/presentation/manager/bottom_nav_bar_states.dart';
import 'package:parking/featuers/home/presentation/views/home_view.dart';
import 'package:parking/featuers/parking_history/presentation/views/my_parking_view.dart';
import 'package:parking/featuers/profile/presentation/view/profile_view.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int selectedPageIndex = 0;
  Widget get selectedPage => pages[selectedPageIndex];
  List<Widget> pages = [
    HomeView(),
    MyParkingView(),
    MyBookMarkView(),
    ProfileView(),
  ];
}
