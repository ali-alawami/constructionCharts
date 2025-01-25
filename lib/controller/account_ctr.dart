import 'package:get/get.dart';
import '../helpers/http_servisce.dart';
import '../model/account_model.dart';

class AccountCtr extends GetxController {
  dynamic loadData = false.obs;
  dynamic errorRequest = false.obs;
  dynamic emptyData = false.obs;
  dynamic notFound = false.obs;
  dynamic dateFrom = DateTime.now().toString().split(' ')[0].obs;
  dynamic dateTo = DateTime.now().toString().split(' ')[0].obs;
  RxList<AccountModel> account = RxList<AccountModel>();

  HttpService httpService = HttpService();
  getXAccount({required accountName}) async {
    loadData.value = true;
    account.clear();
    try {
      var response = await httpService.getAccount(
          accountName: accountName, fromDate: dateFrom, toDate: dateTo);
      // date1: dateFrom, date2: dateTo);
      if (response.isEmpty) {
        notFound.value = true;
        loadData.value = false;
      } else {
        notFound.value = false;
        errorRequest.value = false;
        loadData.value = false;
        account.addAll(response);
      }
    } catch (e) {
      errorRequest.value = true;
      loadData.value = false;
    }
  }

  void restart() {
    notFound.value = false;
    errorRequest.value = false;
    account.clear();
    update();
  }

  changeDateFrom(date) {
    dateFrom.value = date;
    update();
  }

  changeDateTo(date) {
    dateTo.value = date;
    update();
  }
}
