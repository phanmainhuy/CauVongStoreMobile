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

class APIStatus {
  static const int apireturnERROR = -1;
  static const int apireturnOK = 200;
  static const int apireturnSUBMIT = 202;
  static const int apireturnBADREQUEST = 400;
  static const int apireturnUNAUTHORIZED = 401;
  static const int apireturnFORBIDDEN = 403;
  static const int apireturnNOTFOUND = 404;
  static const int apireturnINTERNALSERVERERROR = 500;
  static const int apireturnBADAPI = 502;
  static const int apireturnTIMEOUT = 504;
}
