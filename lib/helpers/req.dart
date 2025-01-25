import 'dart:convert';
import 'package:http/http.dart' as http;
import 'setting.dart';

class Req<T> {
  bool? isOnline, listResponse;
  Req({this.isOnline = false, this.listResponse = true});

  Future<List<T>> getGeneric(String url, T Function(dynamic e) f) async {
    List<T> list;
    var urlEndPoint = _baseUri(url);
    var res = await http.get(urlEndPoint, headers: {
      //HttpHeaders.authorizationHeader: Setting.accessToken,
      "Accept": "application/json",
      'Content-Type': 'application/json; charset=utf-8',
      // 'X-API-Key': Setting.keyDevice,
      // 'session': Setting.token,
    });
    if (res.statusCode == 200) {
      List<dynamic> body;
      if (listResponse == true) {
        body = jsonDecode(res.body);
      } else {
        Map<String, dynamic> map = json.decode(res.body);
        if (map['status'] == "success") {
          body = map["data"];
        } else {
          body = [];
        }
      }
      list = body.map((item) => f(item)).toList();
      return list;
    } else {
      throw ("Canot get TextMe...!");
    }
  }

  Uri _baseUri(String url) {
    var host = "";
    if (isOnline!) {
      host = Setting.onlineUrl; // online
    } else {
      host = Setting.localUrl; // local
    }
    return Uri.parse(host + url);
  }
}
