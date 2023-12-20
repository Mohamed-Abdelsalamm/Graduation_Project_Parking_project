import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class OnBoardingNavigationRow extends StatelessWidget {
  const OnBoardingNavigationRow({
    super.key,
    required this.selectedPage,
    required this.onSkipTapped,
    required this.onNextTapped,
  });

  final int selectedPage;
  final onSkipTapped;
  final onNextTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: onSkipTapped,
            child: Text(
              'SKIP',
              style: TextStyles()
                  .textStyle14Bold
                  .copyWith(color: ColorStyles.blue500),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 7.w,
                      width: selectedPage == index ? 30.w : 7.w,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: selectedPage == index
                            ? ColorStyles.blue500.withOpacity(0.5)
                            : Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onNextTapped,
            child: Text(
              'NEXT',
              style: TextStyles()
                  .textStyle14Bold
                  .copyWith(color: ColorStyles.blue700),
            ),
          ),
        ],
      ),
    );
  }
}
