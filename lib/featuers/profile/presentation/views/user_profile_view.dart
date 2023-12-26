import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';
import 'package:parking/core/widgets/custom_text_form_field.dart';
import 'package:parking/generated/assets.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
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
          'Fill Your Profile',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.r),
                          child: Image.asset(
                            Assets.pngProfilePlaceholder,
                            height: 150.h,
                            width: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 4.h,
                          right: 4.h,
                          child: Container(
                            padding: EdgeInsets.all(4.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: ColorStyles.blue700),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextFormField(
                  hintText2: 'Full Name',
                  textEditingController: TextEditingController(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  hintText2: 'Nickname',
                  textEditingController: TextEditingController(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  hintText2: 'Email',
                  textEditingController: TextEditingController(),
                  suffixIcon: Icon(Icons.email),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  hintText2: 'Phone Number',
                  textEditingController: TextEditingController(),
                  suffixIcon: Icon(Icons.phone),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const CustomButton(title: 'Continue'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
