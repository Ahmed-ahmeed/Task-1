import 'package:flutter/material.dart';

class UserEditing extends StatelessWidget {
  final String text;
  final String title;
  final TextEditingController controller;

  UserEditing({
    required this.text,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = text;  // تعيين النص المبدئي للمتحكم
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
