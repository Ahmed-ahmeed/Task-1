import 'package:deneme/model/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle({
    super.key,
    required this.hitText,
    required this.controller,
    required this.obscureText,
    required this.TextMessage,
    required this.prefixIcon,
  });

  final String hitText;
  final TextEditingController controller;
  final bool obscureText;
  final String TextMessage;
  final Widget prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return TextMessage;
        }
        return null;
      },
      obscureText: obscureText,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ButtonsColor,
            ),
            borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          gapPadding: 4,
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ButtonsColor,
          ),
        ),
        hintText: hitText,
        errorMaxLines: 3,
      ),
    );
  }
}
