// import 'package:flutter/material.dart';
// import '../../../../core/themes/app_colors.dart';
// import '../../../../core/themes/app_styles.dart';

// class CartProductsTotalPrice extends StatelessWidget {
//   const CartProductsTotalPrice({
//     super.key, required this.subtotal, required this.total,
//   });
//   final num subtotal;
//   final num total;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: AppColors.bluePrimaryColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         spacing: 20,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'SubTotal',
//                 style: Styles.styleRegular18(context),
//               ),
//               Text(
//                 subtotal.toString(),
//                 style: Styles.styleRegular18(context),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Shipping fee',
//                 style: Styles.styleRegular18(context)
//                     .copyWith(color: Colors.white),
//               ),
//               Text(
//                 'Free',
//                 style: Styles.styleRegular18(context)
//                     .copyWith(color: const Color(0xFF8CDC8F)),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total Price',
//                 style: Styles.styleSemiBold20(context)
//                     .copyWith(color: Colors.white),
//               ),
//               Text(
//                total.toString(),
//                 style: Styles.styleSemiBold20(context)
//                     .copyWith(color: Colors.white),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
