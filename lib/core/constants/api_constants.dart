class Apis {
  static const String baseUrl = 'https://shopping-com.onrender.com';
  static const String register = '$baseUrl/api/user/register';
  static const String login = '$baseUrl/api/user/login';
  static const String fetchCart = '$baseUrl/api/user/getcart';
  static const String addCart = '$baseUrl/api/user/addtocart';
  static const String deleteCart = '$baseUrl/api/user/updatecart';
}

class ApiHeaders {
  static const unaunthenticatedHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static final aunthenticatedHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': 'Bearer $bearerToken'
  };
}
