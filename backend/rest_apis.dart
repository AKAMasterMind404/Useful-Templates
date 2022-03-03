import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'database.dart';

final client = Dio();

Function _post = client.post;
Function _patch = client.patch;
Function _delete = client.delete;
Function _deleteHTTP = http.delete;
Function _get = client.get;

Future<Map> GET(String url) async {
  return REQUEST(_get, url);
}

Future<Map> POST(String url, Map? body, {String? message}) async {
  return REQUEST(_post, url, body: body);
}

Future<Map> DELETE(String url, {Map? body}) async {
  return REQUEST(_delete, url, body: body);
}

Future<Map> PATCH(String url, Map? body) async {
  return REQUEST(_patch, url, body: body);
}

Future<Map> REQUEST(Function function, String url, {Map? body}) async {
  Map result = {"local_result": "", "local_status": 0};

  try {
    var response;
    int? status;

    if (body == null) {
      response = await function(endpoint + url);
    } else {
      response = await function(endpoint + url,
          data: body == null ? null : jsonEncode(body),
          options: Options(
              headers: {Headers.acceptHeader: Headers.jsonContentType}));
    }
    var decodedResult = Map.castFrom(response.data);

    status = response.data["status"];
    result["local_result"] = decodedResult;
    result["local_status"] = status;
  } on DioError catch (error) {
    result["local_result"] = socketErrorMessage;
    result["local_status"] = error.response!.statusCode;
  } on SocketException {
    print("This is socket exception");
    result["local_result"] = socketErrorMessage;
    result["local_status"] = SERVER_ERROR_CODE;
  } on Exception catch (e) {
    result["local_result"] = miscellaneousErrorMessage;
    result["local_status"] = SERVER_ERROR_CODE;
  }
  return result;
}
