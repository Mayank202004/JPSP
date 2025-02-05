import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jpss/routes/route_names.dart';
import '../../widets/auth_input.dart';
import 'package:get/get.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Padding(
            padding: EdgeInsets.only(top :8.0,bottom: 24),
            child: ElevatedButton.icon(
                onPressed: (){
                  Get.toNamed(RouteNames.homePage);
                },
                style: ButtonStyle(
                    shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),))),
                    backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
                    foregroundColor: WidgetStatePropertyAll(Theme.of(context).indicatorColor),
                    minimumSize: const WidgetStatePropertyAll(Size(double.infinity,56))
                ),
                icon: const Icon(CupertinoIcons.arrow_right),
                label: const Text("Sign In")),
          ),
        ],
      ),
    );
  }
}
