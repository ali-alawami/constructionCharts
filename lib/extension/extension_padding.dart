import 'package:flutter/cupertino.dart';

extension EmptyPadding on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
