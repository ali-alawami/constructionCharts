import 'package:flutter/material.dart';

extension ThemeShortcuts on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  Color? get primaryColor => Theme.of(this).primaryColor;
}
