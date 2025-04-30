abstract class ApiConstants {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  // API Endpoints
  static const String signupEndPoint = 'register';
  static const String loginEndPoint = 'login';
  static const String profileEndPoint = 'profile';
  static const String updateProfileEndPoint = 'update-profile';
  static const String changePasswordEndPoint = 'change-password';
  static const String homeEndPoint = 'home';
  static const String categoriesEndPoint = 'categories';
  static const String favoritesEndPoint = 'favorites';
  static const String cartsEndPoint = 'carts';
  static String updateCartEndPoint({required int cartId}) => 'carts/$cartId';
  static String deleteCartEndPoint({required int cartId}) => 'carts/$cartId';
  static const String settingsEndPoint = 'settings';
  static const String faqsEndPoint = 'faqs';
  static const String contactsEndPoint = 'contacts';
  static const String productsEndPoint = 'products';
  static String productsByCategoryEndPoint({required int categoryId}) =>
      'products?category_id=$categoryId';
  static String productDetailsEndPoint({required int productId}) =>
      'products/$productId';
  static const String searchEndPoint = 'products/search';
  static const String addressesEndPoint = 'addresses';
  static String updateAddressEndPoint({required int addressId}) =>
      'addresses/$addressId';
  static String deleteAddressEndPoint({required int addressId}) =>
      'addresses/$addressId';    

//Api data
  static const String productIDKey = 'product_id';
  static const String categoryIDKey = 'category_id';
  static const String quantityKey = 'quantity';
}
