import 'package:get/get.dart';
import '../helpers/http_servisce.dart';
import '../helpers/setting.dart';
import '../model/gdp_data_model.dart';

class CharctsCtr extends GetxController {
  dynamic loadData = false.obs;
  dynamic loadPage = true.obs;
  dynamic errorRequest = false.obs;
  dynamic emptyData = false.obs;
  dynamic notFound = false.obs;
  dynamic dateFrom = DateTime.now().toString().split(' ')[0].obs;
  dynamic dateTo = DateTime.now().toString().split(' ')[0].obs;
  HttpService httpService = HttpService();
  List<GDPDataModel>? charData;
  RxList<GDPDataModel> account = RxList<GDPDataModel>();
  getCharcts() async {
    loadData.value = true;
    try {
      var response = await httpService.getCharctsApi();
      if (response.isEmpty) {
        notFound.value = true;
        loadData.value = false;
      } else {
        notFound.value = false;
        errorRequest.value = false;
        charData = getCharData(e: response);
      }
      loadData.value = false;
    } catch (e) {
      errorRequest.value = true;
      loadData.value = false;
    }
    return charData;
  }

  changeDateFrom(date) {
    dateFrom.value = date;
    update();
  }

  changeDateTo(date) {
    dateTo.value = date;
    update();
  }

  List<GDPDataModel> charData1 = [];
  List<GDPDataModel> getCharData({required Map e}) {
    // for (var i = 0; i < e.length; i++) {
    //   Setting.account.add(e.keys.elementAt(i));
    //   charData1.add((GDPDataModel(
    //       e.keys.elementAt(i), int.parse(e.values.elementAt(i)))));
    // }
    final List<GDPDataModel> charData = [
      GDPDataModel('الخزينة', double.parse(e['treasuryValue'])),
      GDPDataModel('الخزينة الخاصة', double.parse(e['treasuryPrivateValue'])),
      GDPDataModel('المصرف', double.parse(e['bankValue'])),
      GDPDataModel('المصرف الخاصة', double.parse(e['bankPrivateValue'])),
      GDPDataModel('المصروفات ', double.parse(e['expenseValue'])),
      GDPDataModel('المصروفات الخاصة ', double.parse(e['expensePrivateValue'])),
      GDPDataModel('الإيرادات', double.parse(e['revenuValue'])),
      GDPDataModel('الإيرادات الخاصة', double.parse(e['revenuPrivateValue'])),
    ];
    return charData;
  }
}
