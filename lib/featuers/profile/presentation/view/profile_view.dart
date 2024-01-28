import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/profile/presentation/view/widgets/profile_new_header.dart';
import 'package:parking/featuers/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        /*leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_outlined)),*/
        title: Text("Profile", style: TextStyles().textStyle22Bold),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.adjust,
                size: 25.r,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(
                height: 40.h,
              ),
              const ProfileViewHeader(),
              SizedBox(height: 30.h,),
              Divider(endIndent: 25.w,indent: 25.w,),
              SizedBox(height: 25.h,),
              const ProfileViewBody(),
            ]),
          ),
        ),
      ),
    );
  }
}
