import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/widgets/customTextField.dart';
import 'package:parking/featuers/parking_history/presentation/views/widgets/bookmark_list_item.dart';


class BookmarkViewBody extends StatelessWidget {
  const BookmarkViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(children: [
        SizedBox(height: 20.h,),
        const CustomTextField(hintText: 'search',prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,),),
        Expanded(child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 20.h),
            itemBuilder: (context, index) => const BookmarkListItem(), separatorBuilder: (context, index) => SizedBox(height: 20.h), itemCount: 5,),),
      ],),
    );
  }
}

