import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/size_config.dart';
import '../../../../core/utils/constants.dart';
import '../../models/home_model/banner_model.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({
    super.key,
    required this.banners,
  });
  final List<BannerModel> banners;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: banners
            .map((banner) => CachedNetworkImage(
                  imageUrl: banner.image ?? AppConstants.defaultBannerURL,
                  fit: BoxFit.cover,
                  width: double.infinity,
                    placeholder: (context, url) => Image.asset(
                            Assets.imagesBlueLoading),
                        errorWidget: (context, url, error) => const Icon(Icons.error), 
                ))
            .toList(),
        options: CarouselOptions(
            height: SizeConfig.screenHeight * 0.3,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            viewportFraction: 1.0));
  }
}
