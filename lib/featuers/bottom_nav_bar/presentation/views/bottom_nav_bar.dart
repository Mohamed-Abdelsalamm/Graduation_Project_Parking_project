import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking/featuers/bottom_nav_bar/presentation/manager/bootm_nav_bar_cubit.dart';
import 'package:parking/featuers/bottom_nav_bar/presentation/widgets/custom_bottom_navigation_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: BlocProvider.of<BottomNavBarCubit>(context).selectedPage,
      ),
    );
  }
}
