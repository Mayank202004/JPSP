import 'package:flutter/material.dart';
import 'package:pmsss/utils/type_def.dart';

class AuthInput extends StatelessWidget {
  final String label,hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final ValidatorCallback validatorCallback;
  const AuthInput({
    required this.label,
    required this.hintText,
    required this.controller,
    required this.validatorCallback,
    this.isPasswordField = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validatorCallback,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(color: Colors.grey),
        ),
        label: Text(label),
        hintText: hintText,
      ),
    );
  }
}
