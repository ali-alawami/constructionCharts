import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/theme_app.dart';

class DialogContent extends GetxController {
  Future<void> openAndCloseDialogContent(
      {required context, required content}) async {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "",
      titleStyle: ThemeApp.styleUnSelected(color: Colors.black, size: 16.0),
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            //.horizontal
            // child: SizedBox(
            // color: Colors.amber,
            //height: MediaQuery.of(context).size.height * 0.15,
            Text(content, softWrap: true),
            // ),

            Container(
              // color: Colors.red,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 152, 211),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
