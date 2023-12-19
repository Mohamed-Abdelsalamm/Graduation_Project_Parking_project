import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/featuers/parking_history/presentation/views/widgets/my_parking_view_widgets/canceled_tab.dart';
import 'package:parking/featuers/parking_history/presentation/views/widgets/my_parking_view_widgets/completed_tab.dart';
import 'package:parking/featuers/parking_history/presentation/views/widgets/my_parking_view_widgets/on_going_tab.dart';

class MyParkingView extends StatelessWidget {
  const MyParkingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_outlined)),
          title: Text("My Parking", style: TextStyles().textStyle22Bold),
          bottom: TabBar(
            labelColor: Colors.blue,
            labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
            labelStyle: TextStyles().textStyle18semiBold,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.blue,
            unselectedLabelColor: ColorStyles.grey,
            indicatorWeight: 4,
            unselectedLabelStyle:
                TextStyles().textStyle18regular.copyWith(color: Colors.green),
            indicatorPadding: EdgeInsets.only(top: 25.h),
            tabs: const [
              Tab(
                child: FittedBox(
                  child: Text(
                    "On-going",
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(
                    "Completed",
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(
                    "Canceled",
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  size: 25.r,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: const TabBarView(
            children: [
              OnGoingTab(),
              CompletedTab(),
              CanceledTab(),
            ],
          ),
        ),
      ),
    );
  }
}
