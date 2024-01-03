import 'package:flutter/material.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class CustomSnackBar {
  static void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyles()
              .textStyle14regular
              .copyWith(color: ColorStyles.white),
        ),
        // backgroundColor: ColorStyles.greenLogo,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
