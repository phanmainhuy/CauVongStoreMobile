class API {
  // User
  static const String postRegister = '/register';
  static const String postLogin = '/login';
  static const String postChangePassword = '/change-password';

  // Products
  static const String getAllProducts = '/products';
  static const String getProductDetailByID = '/products/';
  static const String getAllPromotionProducts = '/products/promotion';

  // Categories
  static const String getAllCategories = '/categories/all';
  static const String getSearchCategories = '/categories';

  // Order
  static const String postCreateOrder = '/order';
  static const String getOrderByID = '/order/';
  static const String getOrderListByUser = '/orders-by-user';
}
