import 'package:flutter/material.dart';
import '../../models/faqs_item_model.dart';
import 'faqs_list.dart';

class FAQsViewBody extends StatelessWidget {
  const FAQsViewBody({
    super.key,
    required this.fAQsItems,
  });
  final List<FAQsItemModel> fAQsItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(child: FAQsList(fAQsItems: fAQsItems))
          ],
        ));
  }
}
