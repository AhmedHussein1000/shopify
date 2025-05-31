import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_app/core/cache/cache_keys.dart';
import 'package:shop_app/core/cache/shared_preferences_helper.dart';
import 'package:shop_app/core/di/service_locator.dart';
import 'package:shop_app/custom_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  setupLocator();
  Bloc.observer = CustomBlocObserver();
  await SharedPrefencesHelper.init();
  SharedPrefencesHelper.isOnboardingSkipped =
      SharedPrefencesHelper.getData<bool>(key: CacheKeys.onBoarding) ?? false;
  SharedPrefencesHelper.token =
      SharedPrefencesHelper.getData<String>(key: CacheKeys.token);
}
