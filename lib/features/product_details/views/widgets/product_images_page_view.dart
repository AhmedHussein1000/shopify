import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/size_config.dart';
import '../../../../core/widgets/dot_indicators.dart';

class ProductImagesPageView extends StatefulWidget {
  const ProductImagesPageView({super.key, required this.images});
  final List<String>? images;
  @override
  State<ProductImagesPageView> createState() => _ProductImagesPageViewState();
}

class _ProductImagesPageViewState extends State<ProductImagesPageView> {
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.4,
          child: PageView.builder(
            itemCount: widget.images?.length,
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: widget.images?[index] ?? '',
              placeholder: (context, url) =>
                  Image.asset(Assets.imagesBlueLoading),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
              height: SizeConfig.screenHeight * 0.3,
              width: double.infinity,
            ),
            controller: pageController,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        DotIndicators(
            pageController: pageController, count: widget.images?.length ?? 0),
      ],
    );
  }
}
