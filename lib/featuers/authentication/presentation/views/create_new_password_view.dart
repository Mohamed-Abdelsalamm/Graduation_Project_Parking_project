import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';
import 'package:parking/core/widgets/custom_text_form_field.dart';
import 'package:parking/generated/assets.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text(
          'Create New Password',
          style: TextStyles().textStyle18Bold,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 32.h,
                ),
                Image.asset(
                  Assets.pngPasswordVectors,
                  height: 200.h,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 32.h,
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
                const CustomButton(title: 'Continue'),
                Container(
                  height: 120.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
