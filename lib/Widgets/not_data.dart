import 'package:constructioncharts/extension/extension_image.dart';
import 'package:flutter/material.dart';

import '../helpers/theme_app.dart';

class NotData extends StatelessWidget {
  const NotData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                image: DecorationImage(
                  image: AssetImage('not_data'.gif),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'لا تتوفر بيانات لعرضها ',
            style: ThemeApp.styleSelected(color: Colors.black, size: 14.0),
          ),
        ],
      ),
    );
  }
}
