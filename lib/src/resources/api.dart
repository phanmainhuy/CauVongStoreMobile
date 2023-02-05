import 'package:cauvongstore_mobile/src/resources/const.dart';

class API {
  // User
  static const String postRegister = '${Const.apiAddress}/register';
  static const String postLogin = '${Const.apiAddress}/login';
  static const String postChangePassword =
      '${Const.apiAddress}/change-password';

  // Products
  static const String getAllProducts = '${Const.apiAddress}/products';
  static const String getProductDetailByID = '${Const.apiAddress}/products/';
  static const String getAllPromotionProducts =
      '${Const.apiAddress}/products/promotion';

  // Categories
  static const String getAllCategories = '${Const.apiAddress}/categories/all';
  static const String getSearchCategories = '${Const.apiAddress}/categories';

  // Order
  static const String postCreateOrder = '${Const.apiAddress}/order';
  static const String getOrderByID = '${Const.apiAddress}/order/';
  static const String getOrderListByUser = '${Const.apiAddress}/orders-by-user';
}
