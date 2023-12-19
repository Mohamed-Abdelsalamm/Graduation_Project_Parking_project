import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parking/core/constants.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';

class MyParkingViewListItem extends StatelessWidget {
  const MyParkingViewListItem({Key? key, required this.bookType})
      : super(key: key);

  final String bookType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(children: [
            SizedBox(
              width: 90.w,
              height: 90.w,
              child: CachedNetworkImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1590674899484-d5640e854abe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGFya2luZ3xlbnwwfHwwfHx8MA%3D%3D",
                imageBuilder: (context, imageProvider) => Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SpinKitWave(
                  color: Colors.black,
                  size: 20,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    "San Manolia",
                    style: TextStyles().textStyle18semiBold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "9569, Trantow Courts",
                    style: TextStyles()
                        .textStyle12regular
                        .copyWith(color: ColorStyles.grey),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$8.08",
                        style: TextStyles()
                            .textStyle14Bold
                            .copyWith(color: ColorStyles.blue700),
                      ),
                      Text(
                        "  / 4 hours",
                        style: TextStyles()
                            .textStyle12regular
                            .copyWith(color: ColorStyles.grey),
                      ),
                      const Spacer(),
                      bookType == Constants.kOnGoing
                          ? const SizedBox()
                          : bookType == Constants.kCompleted
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorStyles.green,
                                      ),
                                      borderRadius: BorderRadius.circular(6.r)),
                                  child: Text("completed",
                                      style: TextStyles()
                                          .textStyle12regular
                                          .copyWith(color: ColorStyles.green)),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorStyles.red,
                                      ),
                                      borderRadius: BorderRadius.circular(6.r)),
                                  child: Text("canceled",
                                      style: TextStyles()
                                          .textStyle12regular
                                          .copyWith(color: ColorStyles.red)),
                                ),
                    ],
                  ),
                ])),
          ]),
          Divider(
            height: 40.h,
          ),
          bookType == Constants.kOnGoing
              ? Row(
                  children: [
                    const Expanded(child: CustomButton(title: "View Timer")),
                    SizedBox(
                      width: 20.w,
                    ),
                    const Expanded(child: CustomButton(title: "View Ticket")),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
