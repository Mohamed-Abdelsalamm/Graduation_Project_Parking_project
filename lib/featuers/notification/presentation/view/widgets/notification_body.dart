import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/featuers/notification/presentation/view/widgets/notification_list_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
        itemBuilder: (context, index) => const NotificationListItem() , separatorBuilder: (context, index) => SizedBox(height: 20.h), itemCount: 10);
  }
}
