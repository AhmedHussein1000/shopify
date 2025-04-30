import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/cart/models/cart_item_model.dart';

import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';
import 'package:shop_app/features/categories/models/categories_model/category_model.dart';
import 'package:shop_app/features/faqs/models/faqs_item_model.dart';
import 'package:shop_app/features/favorites/models/favorites_model/favorite_item_model.dart';
import 'package:shop_app/features/favorites/models/favorites_model/favorite_product_model.dart';
import 'package:shop_app/features/home/models/home_model/banner_model.dart';

const FAQsItemModel dummyFAQItem = FAQsItemModel(
    id: 6,
    question: "could I pay via cash on delivery ?",
    answer: "Yes, you can pay on delivery.");
const List<FAQsItemModel> dummyFAQs = [
  dummyFAQItem,
  dummyFAQItem,
  dummyFAQItem,
  dummyFAQItem
];
const BannerModel dummyBanner = BannerModel(
    id: 1,
    image:
        "https://student.valuxapps.com/storage/uploads/banners/1732574054JUQcm.6.jpg");

const List<BannerModel> dummyBanners = [dummyBanner, dummyBanner, dummyBanner];
const ProductModel dummyProduct = ProductModel(
    id: 1,
    image:
        "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
    name: "Product Name",
    description: "Product Description",
    price: 100.0,
    discount: 0,
    inCart: false,
    oldPrice: 0,
    images: [
      "https://student.valuxapps.com/storage/uploads/products/1615440322UAwSF.81KcqNGQIsL._SL1500_.jpg",
      "https://student.valuxapps.com/storage/uploads/products/1615440322UjY4o.71DVgBTdyLL._SL1500_.jpg"
    ],
    inFavorites: false);
const List<ProductModel> dummyProducts = [
  dummyProduct,
  dummyProduct,
  dummyProduct,
  dummyProduct
];
const CategoryModel dummyCategory = CategoryModel(
    id: 1,
    image:
        "https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg",
    name: "Category Name");
const List<CategoryModel> dummyCategories = [
  dummyCategory,
  dummyCategory,
  dummyCategory,
  dummyCategory
];
const FavoriteProductModel dummyFavoriteProduct = FavoriteProductModel(
    id: 1,
    image:
        "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
    name: "Product Name",
    price: 100,
    discount: 0,
    oldPrice: 0);
const FavoriteItemModel dummyFavoriteItem = FavoriteItemModel(
  id: 1,
  product: dummyFavoriteProduct,
);
const List<FavoriteItemModel> dummyFavoriteItems = [
  dummyFavoriteItem,
  dummyFavoriteItem,
  dummyFavoriteItem,
  dummyFavoriteItem
];
const List<FavoriteProductModel> dummyFavoriteProducts = [
  dummyFavoriteProduct,
  dummyFavoriteProduct,
  dummyFavoriteProduct,
  dummyFavoriteProduct
];
const CartItemModel dummyCartItem =
    CartItemModel(id: 11111, product: dummyProduct, quantity: 1);
const List<CartItemModel> dummyCartItems = [
  dummyCartItem,
  dummyCartItem,
  dummyCartItem
];
const AddressModel dummyAddress = AddressModel(
  id: 1,
  name: "Address Name",
  city: "City Name",
  region: "Region Name",
  details: "Address Details",
  notes: "Address Notes",
);
const List<AddressModel> dummyAddresses = [
  dummyAddress,
  dummyAddress,
];
