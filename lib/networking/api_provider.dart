import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "https://api.musixmatch.com/ws/1.1/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      default:
        Fluttertoast.showToast(
            msg: 'Error with StatusCode : ${response.statusCode}');
    }
  }
}
