import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_model/faqs_cubit/faqs_cubit.dart';
import 'widgets/faqs_view_body_bloc_builder.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FAQsCubit(getIt())..getFAQs(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('FAQs'),
          ),
          body: const FaqsViewBodyBlocBuilder()),
    );
  }
}
