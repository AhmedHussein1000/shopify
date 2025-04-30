import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/utils/constants.dart';
import '../../models/faqs_item_model.dart';
import '../../view_model/show_answer_cubit/show_faq_answer_cubit.dart';

class FAQsItem extends StatelessWidget {
  const FAQsItem({super.key, required this.faQsItemModel, required this.index});
  final FAQsItemModel faQsItemModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFAQAnswerCubit, List<bool>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    faQsItemModel.question ?? AppConstants.unknown,
                    style: Styles.styleMedium18(context),
                  ),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context
                          .read<ShowFAQAnswerCubit>()
                          .showAndHideAnswer(index);
                    },
                    icon: state[index]
                        ? const Icon(Icons.remove)
                        : const Icon(Icons.add)),
              ],
            ),
            state[index]
                ? Text(
                    'Answer: ${faQsItemModel.answer}',
                    style: Styles.styleRegular16(context),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
