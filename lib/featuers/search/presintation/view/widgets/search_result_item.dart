import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/generated/assets.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
      decoration: BoxDecoration(color: ColorStyles.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.r,
            height: 60.r,
            child: Image.asset(Assets.pngParkIcon),
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Campion Cottages",style: TextStyles().textStyle18semiBold),
                  SizedBox(height: 10.h,),
                  Text("7159 washington Alley",style: TextStyles().textStyle14regular.copyWith(color: ColorStyles.grey,),),
                ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("1Km",style: TextStyles().textStyle16semiBold),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Text("\$2.22",style: TextStyles().textStyle12semiBold.copyWith(color: ColorStyles.blue700)),
                  Text(" /hour",style: TextStyles().textStyle12regular.copyWith(color: ColorStyles.grey500)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
