import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import '../../widets/auth_input.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController cpasswordController;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.cpasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Name"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              controller: emailController,
              validatorCallback: ValidationBuilder()
                  .required()
                  .build(),
            ),
          ),
          const Text("Email"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              controller: emailController,
              validatorCallback: ValidationBuilder()
                  .required()
                  .email()
                  .build(),
            ),
          ),
          const Text("Password"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              isPasswordField: true,
              controller: passwordController,
              validatorCallback: ValidationBuilder()
                  .required()
                  .minLength(8)
                  .maxLength(50)
                  .build(),
            ),
          ),
          const Text("Confirm Password"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              isPasswordField: true,
              controller: passwordController,
              validatorCallback: ValidationBuilder()
                  .required()
                  .minLength(8)
                  .maxLength(50)
                  .build(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top :8.0,bottom: 24),
            child: ElevatedButton.icon(
                onPressed: (){},
                style: ButtonStyle(
                    shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),))),
                    backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
                    foregroundColor: WidgetStatePropertyAll(Theme.of(context).indicatorColor),
                    minimumSize: const WidgetStatePropertyAll(Size(double.infinity,56))
                ),
                icon: const Icon(CupertinoIcons.arrow_right),
                label: const Text("Register")),
          ),
        ],
      ),
    );

  }
}