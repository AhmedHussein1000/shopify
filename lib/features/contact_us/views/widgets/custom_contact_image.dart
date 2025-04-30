import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../models/contact_model.dart';

class CustomContactImage extends StatelessWidget {
  const CustomContactImage({
    super.key,
    this.padding,
    required this.contact,
    this.width,
    this.height,
  });
  final ContactModel contact;
  final double? width;
  final double? height;

  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      padding: EdgeInsets.all(padding ?? 10),
      decoration: getDecorationColor(contact.id),
      child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: contact.image ?? AppConstants.defaultContactURL),
    );
  }
}

BoxDecoration getDecorationColor(int contactId) {
  switch (contactId) {
    case 1:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff1877F2),
      );
    case 2:
      return const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xff405DE6),
            Color(0xff5851DB),
            Color(0xff833AB4),
            Color(0xffC13584),
            Color(0xffE1306C),
            Color(0xffFD1D1D),
            Color(0xffF77737),
            Color(0xffFCAF45),
            Color(0xffFFDC80),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
    case 3:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff1DA1F2),
      );
    case 4:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffD93025),
      );
    case 5:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff34B7F1),
      );
    case 6:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff25D366),
      );
    case 7:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffFFFC00),
      );
    case 8:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffFF0000),
      );
    case 9:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFAEADAD),
      );
    default:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bluePrimaryColor,
      );
  }
}
