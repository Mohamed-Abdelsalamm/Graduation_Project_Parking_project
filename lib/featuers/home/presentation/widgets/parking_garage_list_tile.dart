import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/home/data/models/parking_garage_model.dart';
import 'package:parking/generated/assets.dart';

class ParkingGarageListTile extends StatelessWidget {
  ParkingGarageListTile({super.key, required this.parkingGarage});

  final ParkingGarage parkingGarage;
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
              parkingGarage.image.toString(),
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
                  parkingGarage.name.toString(),
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
                      parkingGarage.address.toString(),
                      style: TextStyles().textStyle12regular,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      parkingGarage.pricePerHour.toString(),
                      style: TextStyles()
                          .textStyle20Bold
                          .copyWith(color: ColorStyles.blue500),
                    ),
                    Text(
                      "/hr",
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
