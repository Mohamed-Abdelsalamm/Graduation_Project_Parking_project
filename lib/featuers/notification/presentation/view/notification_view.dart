import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/notification/presentation/view/widgets/notification_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: Text("Notification", style: TextStyles().textStyle22Bold),
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
      body: const NotificationBody(),
    );
  }
}