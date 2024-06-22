import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
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
                        "EGP 8.08",
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
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        content: StopwatchPage());
                                  });
                            },
                            child: const CustomButton(title: "View Timer"))),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                        child: GestureDetector(
                            onTap: () => _showQRCodeDialog(context),
                            child: const CustomButton(title: "View Ticket"))),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void _showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Scan the QR Code", textAlign: TextAlign.center),
          content: Icon(
            Icons.qr_code_2,
            size: 200.r,
          ),
        );
      },
    );
  }
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_stopwatch.isRunning) {
        setState(() {});
      }
      _startStopwatch();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
    });
  }

  String _formattedTime() {
    final milliseconds = _stopwatch.elapsedMilliseconds + 10000;
    final minutes = (milliseconds ~/ 60000).toString().padLeft(2, '0');
    final seconds = ((milliseconds ~/ 1000) % 60).toString().padLeft(2, '0');
    final hundredths = ((milliseconds % 1000) ~/ 10).toString().padLeft(2, '0');
    return "$minutes:$seconds.$hundredths";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _formattedTime(),
          style: const TextStyle(fontSize: 48),
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            // _stopStopwatch();
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 60.r,
                      ),
                      const SizedBox(height: 20),
                      const Text("The Parking has Ended",
                          textAlign: TextAlign.center),
                      const SizedBox(height: 20),
                      const Text("The Parking consumed 1 hours",
                          textAlign: TextAlign.center),
                      const SizedBox(height: 12),
                      const Row(
                        children: [
                          Text("The cost of the parking is",
                              textAlign: TextAlign.center),
                          SizedBox(width: 8),
                          Text("EGP  8.08",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorStyles.blue700,
                                  fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: 'Ok',
                      ),
                    ],
                  ));
                });
          },
          title: 'End Parking',
        ),
      ],
    );
  }
}
