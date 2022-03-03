import 'database.dart';
import 'rest_apis.dart';

class UserAPIS {
  static Future<Map> getCall() async {
    if (kDebugMode) {
      print("CALLING getUsers()");
    }
    String endpoint = "users/getAllUsers/";
    return GET(endpoint);
  }

  static Future<Map> getSingleUserData(String id) async {
    // GETS USER DATA AND FILLS UserProvider
    if (kDebugMode) {
      print("CALLING getSingleUserData(String id)");
    }
    String endpoint = "users/getUserInfoAdmin/$id";
    return GET(endpoint);
  }

  static Future<Map> getRecommendations(String id) async {
    if (kDebugMode) {
      print("CALLING getRecommendations(String id)");
    }
    String endpoint = "users/getRecommendations/$id";
    return GET(endpoint);
  }

  static Future<Map> addUser(Map body) async {
    if (kDebugMode) {
      print("CALLING addUser(Map body)");
    }
    String endpoint = "users/addUser/";
    return POST(endpoint, body);
  }
}
