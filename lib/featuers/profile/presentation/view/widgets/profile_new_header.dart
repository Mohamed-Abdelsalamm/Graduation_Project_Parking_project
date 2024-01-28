
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 55.r,
          child: Icon(
            Icons.person,
            size: 85.r,
            color: ColorStyles.grey,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          "Omar Nabel",
          style: TextStyles().textStyle18semiBold,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "OmarNabel@gmail.com",
          style: TextStyles().textStyle14regular,
        ),
      ],
    );
  }
}
