import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: []),
    );
  }
}

// ignore: must_be_immutable
class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem({
    super.key,
    required this.svgIcon,
    required this.isActive,
    required this.hasPermission,
    required this.onTap,
  });

  final String svgIcon;
  final bool isActive;
  final bool hasPermission;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: hasPermission ? onTap : () {},
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  svgIcon,
                  height: 26.h,
                  color: !hasPermission
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : isActive
                          ? Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedIconTheme
                              ?.color
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedIconTheme
                              ?.color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
