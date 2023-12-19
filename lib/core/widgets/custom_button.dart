import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.onPressed}) : super(key: key);

  final String title;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(Colors.white12),
          fixedSize: MaterialStatePropertyAll(Size(390.w, 48.h)),
          backgroundColor: const MaterialStatePropertyAll(ColorStyles.blue500),
          elevation: const MaterialStatePropertyAll(3),
        ),
        child: Text(
          title,
          style: TextStyles().textStyle14semiBold.copyWith(color: ColorStyles.white),
          textAlign: TextAlign.center,
        ));
  }
}
