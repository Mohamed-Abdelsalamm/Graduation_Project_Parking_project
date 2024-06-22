// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/app_router.dart';
import 'package:parking/core/utils/box_shadow_constants.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';
import 'package:parking/featuers/home/data/models/parking_garage_model.dart';
import 'package:parking/featuers/nav_bar/presentation/manger/botton_nav_bar_cubit.dart';
import 'package:parking/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class GarageView extends StatefulWidget {
  const GarageView({super.key, required this.garageModel});
  final ParkingGarage garageModel;
  @override
  State<GarageView> createState() => _GarageViewState();

  static Future<void> launchGoogleMaps() async {
    const double destinationLatitude = 31.0409;
    const double destinationLongitude = 31.3785;
    final uri = Uri(
        scheme: "google.navigation",
        queryParameters: {'q': '$destinationLatitude, $destinationLongitude'});
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('An error occurred');
    }
  }
}

class _GarageViewState extends State<GarageView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _showDataAfterDelay();
  }

  void _showDataAfterDelay() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text(
          'Garage Details',
          style: TextStyles().textStyle18Bold,
        ),
      ),
      body: SafeArea(
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ColorStyles.blue700,
                ))
              : Stack(
                  children: [
                    Positioned.fill(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Image.network(
                              widget.garageModel.image,
                              width: MediaQuery.of(context).size.width,
                              height: 240.h,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: EdgeInsets.all(16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              widget.garageModel.name,
                                              style:
                                                  TextStyles().textStyle20Bold,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Text(
                                              widget.garageModel.address,
                                              style: TextStyles()
                                                  .textStyle14regular,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration:
                                                  const Duration(seconds: 1),
                                              backgroundColor: ColorStyles
                                                  .blue700
                                                  .withOpacity(0.8),
                                              content: const Text(
                                                  "Added to your bookmarks"),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(8.h),
                                          child: SvgPicture.asset(
                                            Assets.svgBookmarkActive,
                                            color: ColorStyles.blue700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          GarageView.launchGoogleMaps();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.h, horizontal: 12.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: ColorStyles.blue700,
                                                  width: 1.5)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.svgLocationMarker,
                                                height: 12.h,
                                                color: ColorStyles.blue700,
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              const Text('2 km'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.h, horizontal: 12.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                            border: Border.all(
                                                color: ColorStyles.blue700,
                                                width: 1.5)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.svgClock,
                                              height: 12.h,
                                              color: ColorStyles.blue700,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            const Text('8 AM - 10 PM'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.h, horizontal: 12.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                            border: Border.all(
                                                color: ColorStyles.blue700,
                                                width: 1.5)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.attach_money_rounded,
                                              size: 18.h,
                                              color: ColorStyles.blue700,
                                            ),
                                            Text(
                                                '${widget.garageModel.pricePerHour} / hr'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Text(
                                    'Description',
                                    style: TextStyles().textStyle18Bold,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Book Parking'),
                                content: const Text(
                                    'Are you sure you want to book this parking?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: Colors.green,
                                                  size: 60.r),
                                              SizedBox(height: 14.h),
                                              const Text(
                                                'Your parking has been booked successfully!',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(height: 10.h),
                                              CustomButton(
                                                title: "OK",
                                                onPressed: () {
                                                  GoRouter.of(context).go(
                                                      AppRouter.kBottomNavBar);
                                                  context
                                                      .read<
                                                          BottomNavigationCubit>()
                                                      .updateIndex(1);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadowsConstants.lightBoxShadow
                                ],
                                color: ColorStyles.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.r))),
                            child: const Row(
                              children: [
                                Expanded(
                                    child: CustomButton(title: "Book Parking")),
                              ],
                            ),
                          ),
                        ))
                  ],
                )),
    );
  }
}
