import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../main.dart';
import '../model/account_model.dart';
import 'req.dart';
import 'setting.dart';

class HttpService {
  getCharctsApi() async {
    String url = "endPointCharcts.php";
    var response = await Dio().get('${Setting.onlineUrl}' '$url',
        options: Options(
          headers: {
            // "X-API-Key": Setting.keyDevice,
          },
        ));
    //  Map mapData = json.decode(response.data);
    Map mapData = jsonDecode(response.data);
    return mapData;
  }

  Future<List<AccountModel>> getAccount(
      {required fromDate, required toDate, required accountName}) async {
    HttpOverrides.global = MyHttpOverrides();
    String url;
    url =
        'endPointAccount.php?accountName=$accountName&from_date=$fromDate&to_date=$toDate';
    var apiCaller = Req<AccountModel>(listResponse: false, isOnline: true);
    var generic =
        await apiCaller.getGeneric(url, (e) => AccountModel.fromJson(e));
    return generic;
  }
}
