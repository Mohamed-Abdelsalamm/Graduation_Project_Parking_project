import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText2,
    required this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.boxShadow,
  });
  var hintText2;
  var textEditingController;
  var prefixIcon;
  var suffixIcon;
  var obscureText;
  var boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
      ),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText2,
          hintStyle: const TextStyle(color: ColorStyles.grey, height: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
            borderSide: BorderSide.none,
          ),
          fillColor: ColorStyles.grey300,
          filled: true,
          isCollapsed: false,
          prefixIcon: prefixIcon != null
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      prefixIcon,
                    ],
                  ),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      suffixIcon,
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
