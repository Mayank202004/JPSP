import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:jpss/utils/helper.dart';
import '../../controllers/auth_controller.dart';
import '../../widets/auth_input.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController cpasswordController;

  RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.cpasswordController,
    required this.usernameController,
  });

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  void submit() {
    if (authController.loading.value) return;

    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text != cpasswordController.text) {
        showSnackBar("Error", "Passwords do not match");
        return;
      }
      authController.register(
        name: nameController.text.trim(),
        username: usernameController.text.trim(),
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
          const Text("Full Name"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              controller: nameController,
              validatorCallback: ValidationBuilder().required().minLength(5).maxLength(50).build(),
            ),
          ),
          const Text("Username"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              controller: usernameController,
              validatorCallback: ValidationBuilder().required().minLength(3).maxLength(15).build(),
            ),
          ),
          const Text("Email"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              controller: emailController,
              validatorCallback: ValidationBuilder().required().email().build(),
            ),
          ),
          const Text("Password"),
          StatefulBuilder(
            builder: (context, setState) {
              bool obscurePass = true;

              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: AuthInput(
                  controller: passwordController,
                  isPasswordField: obscurePass,
                  validatorCallback: ValidationBuilder()
                      .required()
                      .minLength(8)
                      .maxLength(50)
                      .build(),
                ),
              );
            },
          ),
          const Text("Confirm Password"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
            child: AuthInput(
              controller: cpasswordController,
              isPasswordField: true,
              validatorCallback: ValidationBuilder()
                  .required()
                  .minLength(8)
                  .maxLength(50)
                  .build(),
            ),
          ),
          Obx(() {
            final isLoading = authController.loading.value;

            return Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24),
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : submit,
                style: ButtonStyle(
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).primaryColor),
                  foregroundColor:
                  WidgetStatePropertyAll(Theme.of(context).indicatorColor),
                  minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 56)),
                ),
                icon: isLoading
                    ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
                    : const Icon(CupertinoIcons.arrow_right),
                label: Text(isLoading ? "" : "Register"),
              ),
            );
          }),
        ],
      ),
    );
  }
}
