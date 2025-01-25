import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import '../helpers/http_servisce.dart';
import '../helpers/theme_app.dart';

class DialogGetCalendar extends GetxController {
  final BuildContext? context;
  DialogGetCalendar({this.context});
  var selectedDate = DateTime.now();
  HttpService httpService = HttpService();
  Future<void> openAndCloseLoadingCalendar(
      {required context, required function}) async {
    Get.defaultDialog(
        backgroundColor: Colors.white,
        title: "",
        titleStyle: ThemeApp.styleUnSelected(color: Colors.black, size: 16.0),
        content: Column(
          children: [
            DatePickerWidget(
              looping: false, // default is not looping
              firstDate: DateTime(1990, 01, 01),
              lastDate: DateTime(2090, 1, 1),
              initialDate: DateTime.now(),
              dateFormat: "dd-MM-yyyy",
              locale: DatePicker.localeFromString('en'),
              onChange: (DateTime newDate, _) => selectedDate = newDate,
              pickerTheme: DateTimePickerTheme(
                itemTextStyle:
                    const TextStyle(color: Colors.black, fontSize: 15),
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 211, 83, 83),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () => {Get.back()},
                  child: Text(
                    "أغلاق",
                    style: ThemeApp.styleUnSelected(
                        color: Colors.white, size: 14.0),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 83, 152, 211),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () =>
                      {function(selectedDate.toString(), context), Get.back()},
                  child: Text(
                    "تأكيد",
                    style: ThemeApp.styleUnSelected(
                        color: Colors.white, size: 14.0),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
