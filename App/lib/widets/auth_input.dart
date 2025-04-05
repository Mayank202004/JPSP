import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validatorCallback;
  final bool isPasswordField;

  AuthInput({
    super.key,
    required this.controller,
    this.validatorCallback,
    this.isPasswordField = false,
  });

  final RxBool _obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    if (isPasswordField) {
      return Obx(() => TextFormField(
        controller: controller,
        validator: validatorCallback,
        obscureText: _obscureText.value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText.value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              _obscureText.value = !_obscureText.value;
            },
          ),
        ),
      ));
    } else {
      return TextFormField(
        controller: controller,
        validator: validatorCallback,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      );
    }
  }
}
