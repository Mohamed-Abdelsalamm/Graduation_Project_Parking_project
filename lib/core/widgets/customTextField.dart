import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.prefixIcon,
    this.closeOnTapOutside = false,
    this.maxLines = 1,
    this.horizontalContentPadding = 16,
    this.verticalContentPadding = 10,
    this.suffixIcon, this.controller,
    this.onChanged,
    this.hintStyle, this.fillColor,
  }) : super(key: key);

  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final bool obscureText;
  final bool closeOnTapOutside;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final double horizontalContentPadding;
  final double verticalContentPadding;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles().textStyle14regular.copyWith(color: ColorStyles.black),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: ColorStyles.black,
      onTapOutside: (event) {
        closeOnTapOutside ? FocusManager.instance.primaryFocus?.unfocus() : null;
      },
      validator: validator,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        suffixIconColor: ColorStyles.grey.withOpacity(0.6),
        contentPadding: EdgeInsets.symmetric(horizontal: horizontalContentPadding.sp,vertical: horizontalContentPadding.sp),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? TextStyles().textStyle14regular.copyWith(color: ColorStyles.grey.withOpacity(0.7)),
       /* enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: const BorderSide(color: ColorStyles.grey)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: const BorderSide(color: ColorStyles.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: const BorderSide(color: ColorStyles.grey)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: const BorderSide(color: ColorStyles.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: const BorderSide(color: ColorStyles.red)),*/
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}