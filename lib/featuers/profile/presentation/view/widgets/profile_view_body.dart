
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.person_outline,size: 30.r),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "Edit profile",
                  style: TextStyles().textStyle16regular,
                ),
              ]),
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.account_balance_wallet_outlined,size: 30.r),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "Payment",
                  style: TextStyles().textStyle16regular,
                ),
              ]),
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.notifications_none_outlined,size: 30.r),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "Notification",
                  style: TextStyles().textStyle16regular,
                ),
              ]),
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.security,size: 30.r),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "Security",
                  style: TextStyles().textStyle16regular,
                ),
              ]),
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.help_outline,size: 30.r),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "Help",
                  style: TextStyles().textStyle16regular,
                ),
              ]),
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.logout,size: 30.r,color: ColorStyles.red),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  "Logout",
                  style: TextStyles().textStyle16regular.copyWith(color: ColorStyles.red),
                ),
              ]),
        ),
      ],
    );
  }
}
