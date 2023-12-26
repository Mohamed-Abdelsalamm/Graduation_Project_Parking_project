import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({Key? key}) : super(key: key);

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
            width: 70.r,
            height: 70.r,
            child: Icon(Icons.notifications,color: Colors.amber,size: 45.r),
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Successfully",style: TextStyles().textStyle18semiBold,maxLines: 1,overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10.h,),
                  Text("parking booking at portly success",style: TextStyles().textStyle14regular.copyWith(color: ColorStyles.grey,),maxLines: 1,overflow: TextOverflow.ellipsis),
                ]),
          ),
        ],
      ),
    );
  }
}
