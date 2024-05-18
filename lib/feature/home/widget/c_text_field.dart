import 'package:flutter/material.dart';

class CField extends StatelessWidget {
  final String? hintText;

  final TextEditingController controller;

  const CField(
      {super.key, this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      maxLines: null,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
    );
  }
}
