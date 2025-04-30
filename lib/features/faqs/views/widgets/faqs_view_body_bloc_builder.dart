import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/helpers/dummy_data.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_model/faqs_cubit/faqs_cubit.dart';
import '../../view_model/show_answer_cubit/show_faq_answer_cubit.dart';
import 'faqs_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FaqsViewBodyBlocBuilder extends StatelessWidget {
  const FaqsViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FAQsCubit, FAQsState>(
      builder: (context, state) {
        if (state is FAQsSuccess) {
          return BlocProvider(
            create: (context) =>
                ShowFAQAnswerCubit(state.faqsModel.faqsData!.faqsData!.length),
            child: FAQsViewBody(
              fAQsItems: state.faqsModel.faqsData!.faqsData!,
            ),
          );
        } else if (state is FAQsFailure) {
          return CustomTextMessage(text: state.message);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
