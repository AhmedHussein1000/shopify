import 'package:flutter/widgets.dart';
import '../../models/faqs_item_model.dart';
import 'faqs_item.dart';

class FAQsList extends StatelessWidget {
  const FAQsList({super.key, required this.fAQsItems});
  final List<FAQsItemModel> fAQsItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: fAQsItems.length,
      itemBuilder: (context, index) => FAQsItem(
        faQsItemModel: fAQsItems[index],
        index: index,
      ),
    );
  }
}
