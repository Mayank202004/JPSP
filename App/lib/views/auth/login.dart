import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import '../../controllers/auth_controller.dart';
import '../../widets/auth_input.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  /*
  * @desc Used to validate and then call SignIn from Auth Controller
  */
  void submit() {
    if (authController.loading.value) return;

    if (_formKey.currentState?.validate() ?? false) {
      authController.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            padding: const EdgeInsets.only(top: 8.0, bottom: 24),
            child: Obx(() => ElevatedButton.icon(
              onPressed: submit,
              style: ButtonStyle(
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).primaryColor),
                foregroundColor: WidgetStatePropertyAll(
                    Theme.of(context).indicatorColor),
                minimumSize:
                const WidgetStatePropertyAll(Size(double.infinity, 56)),
              ),
              icon: authController.loading.value
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : const Icon(CupertinoIcons.arrow_right),
              label: Text(
                authController.loading.value ? "" : "Sign In",
              ),
            )),
          ),
        ],
      ),
    );
  }
}
