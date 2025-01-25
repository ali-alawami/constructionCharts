import 'package:flutter/material.dart';

import '../helpers/theme_app.dart';

class TextFieldTheme extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final double? textsize;
  final Color? textColor;
  final Color? fillColor;
  final Color? borderColor;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final String? Function(String?)? validation;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;
  const TextFieldTheme(
      {Key? key,
      required this.text,
      required this.controller,
      this.maxLines,
      this.textsize,
      this.fillColor,
      this.borderColor,
      this.keyboardType,
      this.validation,
      this.onChanged,
      this.textAlign,
      this.textColor,
      this.suffixIcon,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      textAlign: textAlign ?? TextAlign.start,
      onChanged: (value) => onChanged,
      validator: validation,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      enableSuggestions: false,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor,
        focusedBorder: ThemeApp.outlineInputBorder,
        enabledBorder: ThemeApp.outlineInputBorder,
        label: Text(
          text,
          style: ThemeApp.styleUnSelected(
              color: textColor ?? Colors.grey, size: 14.0),
        ),
      ),
    );
  }
}
