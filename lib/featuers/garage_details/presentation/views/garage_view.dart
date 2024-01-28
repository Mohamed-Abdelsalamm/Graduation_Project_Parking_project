import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking/core/utils/box_shadow_constants.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';
import 'package:parking/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class GarageView extends StatelessWidget {
  const GarageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text(
          'Garage Details',
          style: TextStyles().textStyle18Bold,
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Image.network(
                    "https://www.huntingtonplacedetroit.com/assets/img/P9391-60b6a36701.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: 240.h,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Parking of City Stars",
                                    style: TextStyles().textStyle20Bold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "9599, Cairo St. Lorem Ipsum Data",
                                    style: TextStyles().textStyle14regular,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.svgBookmarkActive,
                              color: ColorStyles.blue700,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                launchGoogleMaps();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                        color: ColorStyles.blue700, width: 1.5)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.svgLocationMarker,
                                      height: 12.h,
                                      color: ColorStyles.blue700,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    const Text('2 km'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                      color: ColorStyles.blue700, width: 1.5)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgClock,
                                    height: 12.h,
                                    color: ColorStyles.blue700,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  const Text('8 AM - 10 PM'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                      color: ColorStyles.blue700, width: 1.5)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.attach_money_rounded,
                                    size: 18.h,
                                    color: ColorStyles.blue700,
                                  ),
                                  const Text('2.00 / hr'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Description',
                          style: TextStyles().textStyle18Bold,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadowsConstants.lightBoxShadow],
                    color: ColorStyles.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.r))),
                child: const Row(
                  children: [
                    Expanded(child: CustomButton(title: "Book Parking")),
                  ],
                ),
              ))
        ],
      )),
    );
  }
  static Future<void> launchGoogleMaps() async {
    const double destinationLatitude= 31.0409;
    const double destinationLongitude = 31.3785;
    final uri = Uri(
        scheme: "google.navigation",
        queryParameters: {
          'q': '$destinationLatitude, $destinationLongitude'
        });
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('An error occurred');
    }
  }
}
