import '../../../core/helpers/assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingModel(
      {required this.image, required this.title, required this.subTitle});
}

List<OnboardingModel> onboardingItemsList = const [
  OnboardingModel(
      image: Assets.imagesGetYourOrder,
      title: 'Find Your Product',
      subTitle: 'Find your desired products that you want to buy easily'),
  OnboardingModel(
      image: Assets.imagesPurchaseOnline,
      title: 'Easy and Safe Payment',
      subTitle: 'Pay for the products that you buy safely and easily'),
  OnboardingModel(
      image: Assets.imagesTrackOrder,
      title: 'Track Your Orders',
      subTitle: 'Track your orders in real time with our app')
];
