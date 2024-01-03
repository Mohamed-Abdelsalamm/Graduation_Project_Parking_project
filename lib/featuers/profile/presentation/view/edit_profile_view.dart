import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/customTextField.dart';
import 'package:parking/core/widgets/custom_button.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: Text("Edit Profile", style: TextStyles().textStyle22Bold),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(vertical: 40.h,horizontal: 20.w),
        child:CustomButton(title: "Update",onPressed: (){}),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            const CustomTextField(hintText: "Mohamed abdelsalam",fillColor: ColorStyles.blue100,prefixIcon: Icon(Icons.person_outline)),
            SizedBox(height: 35.h,),
            const CustomTextField(hintText: "abdelslamm67@gamil.com",fillColor: ColorStyles.blue100,prefixIcon: Icon(Icons.email_outlined)),
            SizedBox(height: 35.h,),
            const CustomTextField(hintText: "12/27/1995",fillColor: ColorStyles.blue100,prefixIcon: Icon(Icons.date_range)),
            SizedBox(height: 35.h,),
            const CustomTextField(hintText: "Egypt",fillColor: ColorStyles.blue100,prefixIcon: Icon(Icons.location_on_outlined)),
            SizedBox(height: 35.h,),
            const CustomTextField(hintText: "+201122373042",fillColor: ColorStyles.blue100,prefixIcon: Icon(Icons.phone_outlined)),
          ],
        ),
      ),
    );
  }
}
