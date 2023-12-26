import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/customTextField.dart';
import 'package:parking/featuers/search/presintation/view/widgets/search_result_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 30.h),
          child: Column(
            children: [
               CustomTextField(
                hintText: "search",
                fillColor: ColorStyles.blue300.withOpacity(0.5),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: ColorStyles.blue700,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Result (1274)", style: TextStyles().textStyle16semiBold),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_outlined)),
              ]),
              SizedBox(
                height: 14.h,
              ),
              Expanded(child: ListView.separated(itemBuilder: (context, index) => const SearchResultItem(), separatorBuilder:(context, index) => SizedBox(height: 10.h), itemCount: 10))
            ],
          ),
        ),
      ),
    );
  }
}