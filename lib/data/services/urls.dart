class Urls {
  static const String baseUrl = "https://api.zhndev.site/wp-json/";
  static const String registrationUrl = "${baseUrl}base/api/auth/register";

  static const String loginUrl = "${baseUrl}base/api/auth/login";
  static const String forgotPasswordUrl =
      "${baseUrl}base/api/auth/forgot-password";

  static const String notificationUrl = "$baseUrl/api/notifications";
  static const String allproductsUrl =
      "https://api.zhndev.site/wp-json/foodflow/v1/products";

  static String getSingleproductsUrl(int id) =>
      "https://api.zhndev.site/wp-json/foodflow/v1/products/$id";

  static String searchItemUrl(String query) =>
      'https://api.zhndev.site/wp-json/foodflow/v1/products/search?q=$query&limit=10';
}
