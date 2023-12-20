import 'package:parking/featuers/onboarding/data/models/onboarding_page_model.dart';
import 'package:parking/featuers/onboarding/data/repo/onboarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  List<OnBoardingPageModel> getOnBoardingPages() {
    return [
      OnBoardingPageModel(
        assetImage: 'assets/png/onboarding1.png',
        titlePart1: 'Find Parking',
        titleKeyword: 'Places',
        titlePart2: 'Around You Easily',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      ),
      OnBoardingPageModel(
        assetImage: 'assets/png/onboarding2.png',
        titlePart1: 'Book And Pay',
        titleKeyword: 'Parking',
        titlePart2: 'Quickly And Safely',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      ),
      OnBoardingPageModel(
        assetImage: 'assets/png/onboarding3.png',
        titlePart1: 'Extend',
        titleKeyword: 'Parking',
        titlePart2: 'Time As You Need',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      ),
    ];
  }
}
