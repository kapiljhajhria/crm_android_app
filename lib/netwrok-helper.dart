import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';

class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  String koki;
  String kokiSig;

  Future get(String url) async {
    print("printing headers of get request");
    print(headers);
    http.Response response = await http.get(url, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  Future<Map> post(String url, dynamic data) async {
    http.Response response =
        await http.post(url, body: jsonEncode(data), headers: headers);
    print("let see headers");
    String cookie = response.headers["set-cookie"];
    cookie = cookie.replaceAll(",", " ");
    print(cookie.split(";")[0]);
    print(cookie.split(";")[6]);
    print(cookie);
    updateCookie(response);
    return json.decode(response.body);
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    headers['cookie'] =
    "forms-login=eyJ1c2VySWQiOiI1ZWIzYmNjMTE3ZmVmNTJlYWNiZTA2YzkifQ==;forms-login.sig=ySObHjT5HQphV0p_VHHHZk1Ue9I;";

  }
}
