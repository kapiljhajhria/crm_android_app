import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';

class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  String cookie = "";

  Future get(String url) async {
    print("printing headers of get request");
    print(headers);
    http.Response response = await http.get(url, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  String getCookie(String cookieString) {
    String cookie = "";
    List cookiesList = cookieString.split(";");
    cookie = cookie + cookiesList[0] + ";" + cookiesList[3].split(",")[1] + ";";
    print("cookie is: " + cookie);
    return cookie;
  }

  Future<Map> post(String url, dynamic data) async {
    http.Response response =
        await http.post(url, body: jsonEncode(data), headers: headers);
    print("let see headers");
    updateCookie(response);
    return json.decode(response.body);
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      headers['cookie'] = getCookie(rawCookie);
    }
  }
}
