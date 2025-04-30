import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../core/themes/app_colors.dart';
import '../../cart/view_models/carts_cubit/carts_cubit.dart';
import '../../cart/views/cart_view.dart';
import '../../categories/views/categories_view.dart';
import '../../favorites/view_models/get_favorites_cubit/favorites_cubit.dart';
import '../../favorites/views/favorites_view.dart';
import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';

class MainLayoutsView extends StatefulWidget {
  const MainLayoutsView({super.key});

  @override
  State<MainLayoutsView> createState() => _MainLayoutsViewState();
}

class _MainLayoutsViewState extends State<MainLayoutsView> {
  @override
  initState() {
    context.read<FavoritesCubit>().getFavorites();
    context.read<CartsCubit>().getCarts();
    super.initState();
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CategoriesView(),
      const FavoritesView(),
      const CartView(),
      const SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.bluePrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category),
        title: "Categories",
        activeColorPrimary: AppColors.bluePrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Favorites",
        activeColorPrimary: AppColors.bluePrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: AppColors.bluePrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Settings",
        activeColorPrimary: AppColors.bluePrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      handleAndroidBackButtonPress: true,
      navBarStyle: NavBarStyle.style1,
      decoration: NavBarDecoration(
        colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
    );
  }
}
