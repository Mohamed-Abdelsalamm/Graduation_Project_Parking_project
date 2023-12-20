import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/featuers/onboarding/data/repo_impl/onboarding_repo_impl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _pageIndex = 0;
  final pages = OnBoardingRepoImpl().getOnBoardingPages();
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PageView.builder(
                controller: pageViewController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(page.assetImage),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: page.titlePart1),
                            TextSpan(text: page.titleKeyword),
                            TextSpan(text: page.titlePart2),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Row(
                children: [
                  Text('SKIP'),
                  Expanded(
                    child: Center(
                      child: Row(
                        children: [
                          ...List.generate(
                            pages.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 10.w,
                              width: pageViewController.page!.round() == index
                                  ? 30.w
                                  : 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.w),
                                color: pageViewController.page!.round() == index
                                    ? Colors.blueAccent
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'NEXT',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
