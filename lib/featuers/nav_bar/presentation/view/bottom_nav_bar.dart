import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/book_mark/presentation/view/my_book_mark_view.dart';
import 'package:parking/featuers/home/presentation/views/home_view.dart';
import 'package:parking/featuers/nav_bar/presentation/manger/botton_nav_bar_cubit.dart';
import 'package:parking/featuers/parking_history/presentation/views/my_parking_view.dart';
import 'package:parking/featuers/profile/presentation/views/user_profile_view.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: const <Widget>[
              HomeView(),
              MyParkingView(),
              MyBookMarkView(),
              UserProfileView(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state,
            selectedItemColor: ColorStyles.blue700,
            // unselectedItemColor: ColorStyles.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<BottomNavigationCubit>().updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(Icons.home,color: ColorStyles.blue700),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_parking),
                label: 'MyParking',
                activeIcon: Icon(Icons.local_parking,color: ColorStyles.blue700),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'BookMark',
                activeIcon: Icon(Icons.bookmark,color: ColorStyles.blue700),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                activeIcon: Icon(Icons.person,color: ColorStyles.blue700),
              ),
            ],
          );
        },
      ),
    );
  }
}
