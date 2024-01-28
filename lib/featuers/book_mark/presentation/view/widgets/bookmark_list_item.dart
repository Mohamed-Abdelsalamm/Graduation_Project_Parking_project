import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/home/data/models/parking_garage_model.dart';
import 'package:parking/generated/assets.dart';

class BookmarkListItem extends StatelessWidget {
  BookmarkListItem({
    super.key,
    required this.garageModel,
  });
  final ParkingGarage garageModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70.r,
            height: 70.r,
            child: CachedNetworkImage(
              imageUrl: garageModel.image,
              imageBuilder: (context, imageProvider) => Container(
                width: 70.r,
                height: 70.r,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const SpinKitWave(
                color: Colors.black,
                size: 10,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(garageModel.name, style: TextStyles().textStyle18semiBold),
              SizedBox(
                height: 10.h,
              ),
              Text(
                garageModel.address,
                style: TextStyles().textStyle14regular.copyWith(
                      color: ColorStyles.grey,
                    ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                Assets.pngArchiveIcon,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
