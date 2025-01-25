import 'dart:typed_data';
import 'package:constructioncharts/extension/extension_image.dart';
import 'package:flutter/material.dart';

import '../helpers/setting.dart';

class ImgPositioned extends StatelessWidget {
  final Uint8List? ulrImg;
  const ImgPositioned({Key? key, this.ulrImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ulrImg == null
        ? Positioned(
            right: MediaQuery.of(context).size.width * 0.69,
            top: MediaQuery.of(context).size.height <= Setting.sizeJ7
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.height * 0.03,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey[300],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('not_img'.jpg),
                ),
              ),
            ),
          )
        : Positioned(
            right: MediaQuery.of(context).size.width * 0.69,
            top: MediaQuery.of(context).size.height <= Setting.sizeJ7
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.height * 0.03,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey[300],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(ulrImg!, scale: 0.5),
                ),
              ),
            ),
          );
  }
}
