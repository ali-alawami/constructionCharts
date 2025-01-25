import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/account_ctr.dart';
import '../helpers/theme_app.dart';
import 'dialog_get_calendar.dart';

class CalendarCont extends StatelessWidget {
  final bool from;
  final Function(String, BuildContext)? function;
  CalendarCont({Key? key, this.function, required this.from}) : super(key: key);
  final DialogGetCalendar controller = Get.put(DialogGetCalendar());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        controller.openAndCloseLoadingCalendar(
            context: context, function: function)
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: Color.fromARGB(
                255, 83, 152, 211) //Theme.of(context).primaryColor,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GetBuilder<AccountCtr>(
                init: AccountCtr(),
                builder: (controller) => Text(
                  from
                      ? (controller.dateFrom).toString()
                      : (controller.dateTo).toString(),
                  style:
                      ThemeApp.styleSelected(color: Colors.white, size: 16.0),
                ),
              ),
            ),
            const Icon(
              color: Colors.white,
              Icons.calendar_month,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
