import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/functions/initialize_app.dart';
import 'features/cart/view_models/carts_cubit/carts_cubit.dart';
import 'features/favorites/view_models/get_favorites_cubit/favorites_cubit.dart';
import 'core/shared/view_models/theme_cubit/theme_cubit.dart';
import 'core/themes/dark_theme.dart';
import 'core/cache/shared_preferences_helper.dart';
import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'core/themes/light_theme.dart';



void main() async {
  await initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => BlocProvider(
        create: (context) => ThemeCubit(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoritesCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => CartsCubit(getIt()),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<ThemeCubit>().state,
        debugShowCheckedModeBanner: false,
        initialRoute: SharedPrefencesHelper.isOnboardingSkipped == true
            ? SharedPrefencesHelper.token != null
                ? Routes.mainLayout
                : Routes.login
            : Routes.onboarding,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}