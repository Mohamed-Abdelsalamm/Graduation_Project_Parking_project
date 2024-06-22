import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/constants.dart';
import 'package:parking/featuers/parking_history/presentation/views/widgets/my_parking_view_widgets/my_parking_view_list_item.dart';

class OnGoingTab extends StatelessWidget {
  const OnGoingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          const MyParkingViewListItem(bookType: Constants.kOnGoing),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      separatorBuilder: (context, index) => SizedBox(
        height: 20.h,
      ),
      itemCount: 1,
    );
  }
}
