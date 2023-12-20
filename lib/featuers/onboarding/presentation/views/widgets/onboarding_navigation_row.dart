import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/featuers/onboarding/data/models/onboarding_page_model.dart';

class OnBoardingNavigationRow extends StatelessWidget {
  const OnBoardingNavigationRow({
    super.key,
    required this.pages,
    required this.pageViewController,
  });

  final List<OnBoardingPageModel> pages;
  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            'SKIP',
            style: TextStyle(
              color: Color(0xFF0C2CFF),
              fontWeight: FontWeight.bold,
              height: 1,
              fontSize: 14.sp,
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10.w,
                      width: pageViewController.page!.round() == index
                          ? 30.w
                          : 10.w,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: pageViewController.page!.round() == index
                            ? Color(0xFF0C2CFF).withOpacity(0.4)
                            : Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'NEXT',
            style: TextStyle(
              color: Color(0xFF0C2CFF),
              fontWeight: FontWeight.bold,
              height: 1,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
