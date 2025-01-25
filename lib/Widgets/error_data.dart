import 'package:constructioncharts/extension/extension_image.dart';
import 'package:flutter/material.dart';

import '../helpers/theme_app.dart';

class ErrorData extends StatelessWidget {
  final bool fromHome;
  const ErrorData({Key? key, required this.fromHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: fromHome ? 50 : 0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: fromHome
                  ? MediaQuery.of(context).size.height * 0.4
                  : MediaQuery.of(context).size.height * 0.28,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                image: DecorationImage(
                  image: AssetImage('error_data'.gif),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            ' توجد مشكلة بالأتصال ',
            style: ThemeApp.styleSelected(color: Colors.red, size: 14.0),
          ),
        ],
      ),
    );
  }
}
