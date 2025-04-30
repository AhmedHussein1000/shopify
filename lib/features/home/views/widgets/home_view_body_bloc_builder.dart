import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/dummy_data.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/home_cubit/home_cubit.dart';
import 'home_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBodyBlocBuilder extends StatelessWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        
        if (state is HomeSuccess) {
          return HomeViewBody(
            homeProducts: state.homeData.products!,
            banners: state.homeData.banners!,
          );
        } else if (state is HomeFailure) {
          return CustomTextMessage(text: state.message);
        } else {
          return const Skeletonizer(
              enabled: true,
              child: HomeViewBody(
                  banners: dummyBanners, homeProducts: dummyProducts));
        }
      },
    );
  }
}
