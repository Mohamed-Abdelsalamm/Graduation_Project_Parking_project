import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/app_router.dart';
import 'package:parking/core/utils/box_shadow_constants.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_text_form_field.dart';
import 'package:parking/featuers/home/presentation/widgets/parking_garage_list_tile.dart';
import 'package:parking/generated/assets.dart';

import '../../data/models/parking_garage_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final name = "Omar";
  final List<ParkingGarage> convertedGarages = [
    {
      "image":
          "https://www.huntingtonplacedetroit.com/assets/img/P9391-60b6a36701.jpg",
      "name": "Freeway Park Garage",
      "address": "1023 Hgih W Street",
      "pricePerHour": "\$10"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1470224114660-3f6686c562eb?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Central Plaza Garage",
      "address": "789 Downtown Avenue",
      "pricePerHour": "\$12"
    },
    {
      "image":
          "https://media.istockphoto.com/id/1578358219/photo/suspended-lift-parking-with-cars.webp?b=1&s=170667a&w=0&k=20&c=ag6BwZG7LDX4hkK78t3U5uPQy7P2jmaW96bhH3M09DM=",
      "name": "Skyline Parking Center",
      "address": "456 Urban Street",
      "pricePerHour": "\$8"
    },
    {
      "image":
          "https://img.freepik.com/free-photo/empty-garage-with-parking-lots-with-concrete-ceiling-flooring-pillars-marked-with-numbers_342744-1241.jpg?size=626&ext=jpg&ga=GA1.1.276142506.1706480567&semt=ais",
      "name": "Metro Park Garage",
      "address": "621 Cityview Lane",
      "pricePerHour": "\$15"
    },
    {
      "image":
          "https://img.freepik.com/premium-photo/car-underground-parking-garage_220873-2142.jpg?w=1060",
      "name": "Downtown Express Parking",
      "address": "987 Avenue Street",
      "pricePerHour": "\$11"
    },
    {
      "image":
          "https://img.freepik.com/free-photo/hallway-garage_23-2149397542.jpg?size=626&ext=jpg&ga=GA1.1.276142506.1706480567&semt=ais",
      "name": "Harbor View Garage",
      "address": "234 Waterfront Road",
      "pricePerHour": "\$14"
    },
    {
      "image":
          "https://www.huntingtonplacedetroit.com/assets/img/P9391-60b6a36701.jpg",
      "name": "City Center Parking",
      "address": "789 Main Street",
      "pricePerHour": "\$9"
    }
  ].map((json) => ParkingGarage.fromJson(json)).toList();

  @override
  Widget build(BuildContext context) {
// Convert JSON back to ParkingGarage instances

    return Scaffold(
      backgroundColor: ColorStyles.blue500,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                      GestureDetector(
                        onTap: () => GoRouter.of(context)
                            .push(AppRouter.kNotificationView),
                        child: Container(
                          padding: EdgeInsets.all(4.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset(
                            Assets.svgNotifications,
                            height: 24.h,
                            colorFilter: const ColorFilter.mode(
                                ColorStyles.blue500, BlendMode.srcIn),
                          ),
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
                    SizedBox(
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
                        itemCount: convertedGarages.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kGarageView,
                                    extra: convertedGarages[index]);
                              },
                              child: ParkingGarageListTile(
                                  parkingGarage: convertedGarages[index]));
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
