import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool obscure;
  TextEditingController controller;
  FormFieldValidator<String> validator;

  AppText(
    this.label,
    this.hint, {
    this.obscure = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
