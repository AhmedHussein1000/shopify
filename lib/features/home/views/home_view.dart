import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/routes/routes.dart';
import '../../search/views/search_products_view.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/helpers/size_config.dart';
import '../view_models/home_cubit/home_cubit.dart';
import 'widgets/home_view_body_bloc_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  BlocProvider(
      create: (context) => HomeCubit(getIt())..getHomeData(),
      child:const Scaffold(
        appBar: HomeAppBar(),
        body:  HomeViewBodyBlocBuilder(),
       
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Shopify'),
      centerTitle: false,
      actions: [
       IconButton(
  onPressed: () =>context.pushPersistentScreen(const SearchProductsView()),
  icon: const Icon(FontAwesomeIcons.search),
),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
