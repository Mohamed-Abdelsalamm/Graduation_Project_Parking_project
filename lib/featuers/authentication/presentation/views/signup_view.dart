import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';
import 'package:parking/generated/assets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200.h,
                ),
                Text(
                  'Create your',
                  style: TextStyles().textStyle30Bold,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Account',
                  style: TextStyles()
                      .textStyle30Bold
                      .copyWith(color: ColorStyles.blue700),
                ),
                SizedBox(
                  height: 48.h,
                ),
                CustomTextFormField(
                  hintText2: 'Email',
                  textEditingController: TextEditingController(),
                  prefixIcon: SvgPicture.asset(
                    Assets.svgEmail,
                    color: ColorStyles.grey,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  hintText2: 'Password',
                  textEditingController: TextEditingController(),
                  prefixIcon: SvgPicture.asset(
                    Assets.svgLock,
                    color: ColorStyles.grey,
                    width: 16.w,
                    height: 16.w,
                  ),
                  obscureText: true,
                  suffixIcon: SvgPicture.asset(
                    Assets.svgShowPassword,
                    color: ColorStyles.grey,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                const CustomButton(title: 'Sign Up'),
                Container(
                  height: 120.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyles()
                          .textStyle12Bold
                          .copyWith(color: ColorStyles.grey500),
                    ),
                    Text(
                      "Log In",
                      style: TextStyles()
                          .textStyle12Bold
                          .copyWith(color: ColorStyles.blue700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText2,
    required this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });
  var hintText2;
  var textEditingController;
  var prefixIcon;
  var suffixIcon;
  var obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText2,
        hintStyle: const TextStyle(
          color: ColorStyles.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
          borderSide: BorderSide.none,
        ),
        fillColor: ColorStyles.grey300,
        filled: true,
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
    );
  }
}
