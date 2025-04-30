import 'package:get_it/get_it.dart';
import 'package:shop_app/features/addresses/repository/addresses_repo_impl.dart';
import 'package:shop_app/features/addresses/repository/base_addresses_repo.dart';
import '../repos/products_repos/base_products_repo.dart';
import '../repos/products_repos/products_repo_impl.dart';
import '../repos/user_repos/base_user_repo.dart';
import '../repos/user_repos/user_repo_impl.dart';
import '../../features/cart/repository/base_cart_repo.dart';
import '../../features/cart/repository/cart_repo_impl.dart';
import '../network/api_service.dart';
import '../../features/about_us/repository/about_us_repo_impl.dart';
import '../../features/about_us/repository/base_about_us_repo.dart';
import '../../features/categories/repository/base_categories_repo.dart';
import '../../features/categories/repository/categories_repo_impl.dart';
import '../../features/contact_us/repository/base_contact_us_repo.dart';
import '../../features/contact_us/repository/contact_us_repo_impl.dart';
import '../../features/faqs/repository/base_faqs_repo.dart';
import '../../features/faqs/repository/faqs_repo_impl.dart';
import '../../features/home/repository/base_home_repo.dart';
import '../../features/home/repository/home_repo_impl.dart';



final GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton<BaseUserRepo>(
    () => UserRepoImpl(getIt()),
  );
  
  getIt.registerLazySingleton<BaseFAQsRepo>(
    () => FAQsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseContactUsRepo>(
    () => ContactUsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseAboutUsRepo>(
    () => AboutUsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseHomeRepo>(
    () => HomeRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseCategoriesRepo>(
    () => CategoriesRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseProductsRepo>(
    () => ProductsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseCartRepo>(() => CartRepoImpl(getIt()),);
  getIt.registerLazySingleton<BaseAddressesRepo>(
    () => AddressesRepoImpl(getIt()),
  );
}
