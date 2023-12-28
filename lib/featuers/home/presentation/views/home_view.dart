import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking/core/utils/box_shadow_constants.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_text_form_field.dart';
import 'package:parking/featuers/home/presentation/widgets/parking_garage_list_tile.dart';
import 'package:parking/generated/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final name = "Omar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blue500,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Image.asset(
                              Assets.pngProfilePlaceholder,
                              height: 30.h,
                              width: 30.h,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset(
                            Assets.svgNotifications,
                            height: 24.h,
                            color: ColorStyles.blue500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Good Morning, $name",
                      style: TextStyles().textStyle12regular.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Find the best\nplace to park.',
                      style: TextStyles()
                          .textStyle20Bold
                          .copyWith(color: Colors.white, height: 1.35),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 16.h, right: 16.h, left: 16.h),
                decoration: BoxDecoration(
                  color: ColorStyles.grey200,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 48.h,
                      child: CustomTextFormField(
                        hintText2: 'Search',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: ColorStyles.grey,
                        ),
                        textEditingController: TextEditingController(),
                        boxShadow: const [BoxShadowsConstants.lightBoxShadow],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Parking Nearby",
                      style: TextStyles().textStyle16Bold,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ParkingGarageListTile();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
