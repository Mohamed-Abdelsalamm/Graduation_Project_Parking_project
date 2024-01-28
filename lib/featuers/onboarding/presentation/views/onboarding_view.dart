import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/app_router.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/onboarding/data/repo/onboarding_repo_impl.dart';
import 'package:parking/featuers/onboarding/presentation/views/widgets/onboarding_navigation_row.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _selectedPage = 0;
  final pages = OnBoardingRepoImpl().getOnBoardingPages();
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      setState(() {
        _selectedPage = pageViewController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: pageViewController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            page.assetImage,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 300.h,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: page.titlePart1 + ' ',
                              style: TextStyles().textStyle26Bold,
                            ),
                            TextSpan(
                              text: page.titleKeyword,
                              style: TextStyles().textStyle26Bold.copyWith(
                                    color: ColorStyles.blue700,
                                  ),
                            ),
                            TextSpan(
                              text: '\n ' + page.titlePart2,
                              style: TextStyles().textStyle26Bold,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0.w),
                        child: Text(
                          page.description,
                          style: TextStyles()
                              .textStyle14regular
                              .copyWith(height: 1.4, color: ColorStyles.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: OnBoardingNavigationRow(
                selectedPage: _selectedPage,
                onSkipTapped: () async {
                  await GoRouter.of(context)
                      .pushReplacement(AppRouter.kLoginView);
                },
                onNextTapped: () async {
                  if ((pageViewController.page!.round() + 1) >= 2) {
                    await GoRouter.of(context)
                        .pushReplacement(AppRouter.kLoginView);
                  }
                  pageViewController.animateToPage(
                      min(pageViewController.page!.round() + 1, 3),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
