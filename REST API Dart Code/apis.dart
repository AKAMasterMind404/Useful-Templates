import 'database.dart';
import 'rest_apis.dart';

class TemplateAPIS {
  static Future<Map> getCall() async {
    if (kDebugMode) {
      print("CALLING getCall()");
    }
    String endpoint = "sample/endpoint";
    return GET(endpoint);
  }

  static Future<Map> postCall(Map? body) async {
    if (kDebugMode) {
      print("CALLING postCall()");
    }
    String endpoint = "sample/endpoint";
    return POST(endpoint, body);
  }

  static Future<Map> patchCall(Map? body) async {
    if (kDebugMode) {
      print("CALLING patchCall()");
    }
    String endpoint = "sample/endpoint";
    return PATCH(endpoint, body);
  }

  static Future<Map> deleteCall() async {
    if (kDebugMode) {
      print("CALLING deleteCall()");
    }
    String endpoint = "sample/endpoint";
    return DELETE(endpoint);
  }
}
