import 'package:constructioncharts/extension/extension_image.dart';
import 'package:flutter/material.dart';

import '../helpers/theme_app.dart';

class NotImages extends StatelessWidget {
  const NotImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.28,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              image: DecorationImage(
                image: AssetImage('not_imgs'.gif),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'لا تتوفر صور لعرضها',
          style: ThemeApp.styleSelected(color: Colors.black, size: 14.0),
        ),
      ],
    );
  }
}
