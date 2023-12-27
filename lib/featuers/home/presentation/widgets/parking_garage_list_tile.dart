import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/generated/assets.dart';

class ParkingGarageListTile extends StatelessWidget {
  const ParkingGarageListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              "https://www.huntingtonplacedetroit.com/assets/img/P9391-60b6a36701.jpg",
              height: 90.h,
              width: 110.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Freeway Park Garage",
                  style: TextStyles().textStyle14Bold,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgLocationMarker,
                      height: 14.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "1023 Hgih W Street",
                      style: TextStyles().textStyle12regular,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$10/",
                      style: TextStyles()
                          .textStyle20Bold
                          .copyWith(color: ColorStyles.blue500),
                    ),
                    Text(
                      "hr",
                      style: TextStyles().textStyle12semiBold,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
