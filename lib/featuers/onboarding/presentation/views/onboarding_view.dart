import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/featuers/onboarding/data/repo_impl/onboarding_repo_impl.dart';
import 'package:parking/featuers/onboarding/presentation/views/widgets/onboarding_navigation_row.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pages = OnBoardingRepoImpl().getOnBoardingPages();
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      setState(() {});
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
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
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: page.titleKeyword,
                                style: TextStyle(
                                  color: Color(0xFF0C2CFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: '\n ' + page.titlePart2,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          page.description,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            height: 1,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: OnBoardingNavigationRow(
                    pages: pages, pageViewController: pageViewController),
              )
            ],
          ),
        ),
      ),
    );
  }
}
