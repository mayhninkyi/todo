import 'package:flutter/material.dart';
import 'package:todo/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.label,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 18.0),
      decoration: InputDecoration(
        labelText: label,
        hintStyle: const TextStyle(fontSize: 18.0),
        labelStyle: const TextStyle(fontSize: 18.0, color: secondaryColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: secondaryColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: secondaryColor)),
      ),
      controller: controller,
    );
  }
}
