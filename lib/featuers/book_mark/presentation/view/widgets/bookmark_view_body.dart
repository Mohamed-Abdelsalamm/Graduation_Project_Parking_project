import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parking/core/utils/app_router.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/widgets/customTextField.dart';
import 'package:parking/featuers/book_mark/presentation/view/widgets/bookmark_list_item.dart';
import 'package:parking/featuers/home/data/models/parking_garage_model.dart';

class BookmarkViewBody extends StatelessWidget {
  BookmarkViewBody({Key? key}) : super(key: key);
  final List<ParkingGarage> convertedGarages = [
    {
      "image":
          "https://www.huntingtonplacedetroit.com/assets/img/P9391-60b6a36701.jpg",
      "name": "elmohfza_parking",
      "address": "1023 Hgih W Street",
      "pricePerHour": "EGP 10"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1470224114660-3f6686c562eb?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Central Plaza Garage",
      "address": "789 Downtown Avenue",
      "pricePerHour": "EGP 12"
    },
    {
      "image":
          "https://media.istockphoto.com/id/1578358219/photo/suspended-lift-parking-with-cars.webp?b=1&s=170667a&w=0&k=20&c=ag6BwZG7LDX4hkK78t3U5uPQy7P2jmaW96bhH3M09DM=",
      "name": "Skyline Parking Center",
      "address": "456 Urban Street",
      "pricePerHour": "EGP 8"
    },
    {
      "image":
          "https://img.freepik.com/free-photo/empty-garage-with-parking-lots-with-concrete-ceiling-flooring-pillars-marked-with-numbers_342744-1241.jpg?size=626&ext=jpg&ga=GA1.1.276142506.1706480567&semt=ais",
      "name": "Metro Park Garage",
      "address": "621 Cityview Lane",
      "pricePerHour": "EGP 15"
    },
    {
      "image":
          "https://img.freepik.com/premium-photo/car-underground-parking-garage_220873-2142.jpg?w=1060",
      "name": "Downtown Express Parking",
      "address": "987 Avenue Street",
      "pricePerHour": "EGP 11"
    },
    {
      "image":
          "https://img.freepik.com/free-photo/hallway-garage_23-2149397542.jpg?size=626&ext=jpg&ga=GA1.1.276142506.1706480567&semt=ais",
      "name": "Harbor View Garage",
      "address": "234 Waterfront Road",
      "pricePerHour": "EGP 14"
    },
    {
      "image":
          "https://www.huntingtonplacedetroit.com/assets/img/P9391-60b6a36701.jpg",
      "name": "City Center Parking",
      "address": "789 Main Street",
      "pricePerHour": "EGP 9"
    }
  ].map((json) => ParkingGarage.fromJson(json)).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const CustomTextField(
            fillColor: ColorStyles.grey300,
            hintText: 'search',
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRouter.kGarageView,
                      extra: convertedGarages[index]),
                  child:
                      BookmarkListItem(garageModel: convertedGarages[index])),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: convertedGarages.length,
            ),
          ),
        ],
      ),
    );
  }
}
