import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';
import 'package:shop_app/features/addresses/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:shop_app/features/login/view_models/login_cubit/login_cubit.dart';
import 'package:shop_app/features/product_details/views/product_details_view.dart';
import 'package:shop_app/features/profile/view_models/profile_cubit/profile_cubit.dart';
import 'package:shop_app/core/di/service_locator.dart';
import 'routes.dart';
import 'package:shop_app/core/widgets/no_route_defined_screen.dart';
import 'package:shop_app/features/cart/views/cart_view.dart';
import 'package:shop_app/features/contact_us/views/contacts_view.dart';
import 'package:shop_app/features/login/views/login_view.dart';
import 'package:shop_app/features/category_products/views/products_by_category_view.dart';
import 'package:shop_app/features/about_us/views/about_us_view.dart';
import 'package:shop_app/features/faqs/views/faqs_view.dart';
import 'package:shop_app/features/search/views/search_products_view.dart';
import 'package:shop_app/features/signup/views/signup_view.dart';
import 'package:shop_app/features/signup/view_models/signup_cubit/signup_cubit.dart';
import 'package:shop_app/features/home/views/home_view.dart';
import 'package:shop_app/features/onboarding/views/onboarding_view.dart';
import 'package:shop_app/features/change_password/views/change_password_view.dart';
import 'package:shop_app/features/profile/views/edit_profile_view.dart';
import 'package:shop_app/features/settings/views/settings_view.dart';
import 'package:shop_app/features/main_layouts/views/main_layouts_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginView(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(getIt()),
            child: const SignupView(),
          ),
        );
      case Routes.mainLayout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProfileCubit(getIt())..getProfile(),
              ),
              BlocProvider(
                create: (context) => AddressesCubit(getIt()),
              ),
            ],
            child: const MainLayoutsView(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) {
          if (arguments is ProductModel) {
            return ProductDetailsView(product: arguments);
          }
          return const NoRouteDefinedScreen();
        });

      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => const SearchProductsView(),
        );

      case Routes.carts:
        return MaterialPageRoute(
          builder: (_) => const CartView(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsView(),
        );
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      case Routes.faqs:
        return MaterialPageRoute(builder: (_) => const FAQsView());

      case Routes.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsView());
      case Routes.categoryProducts:
        final categoryId = arguments as int;
        return MaterialPageRoute(
          builder: (_) => CategoryProductsView(
            categoryId: categoryId,
          ),
        );
      case Routes.contactUs:
        return MaterialPageRoute(
          builder: (context) => const ContactUsView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteDefinedScreen(),
        );
    }
  }
}
