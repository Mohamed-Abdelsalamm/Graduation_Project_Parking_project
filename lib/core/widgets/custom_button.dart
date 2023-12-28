import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      this.onPressed,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(Colors.white12),
          fixedSize: MaterialStatePropertyAll(Size(390.w, 48.h)),
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor ?? ColorStyles.blue700),
          elevation: const MaterialStatePropertyAll(3),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles()
                .textStyle16semiBold
                .copyWith(color: textColor ?? ColorStyles.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
