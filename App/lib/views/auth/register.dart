import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/controllers/auth_controller.dart';
import 'package:jpss/utils/helper.dart';
import '../../routes/route_names.dart';
import '../../widets/auth_input.dart';
import 'package:form_validator/form_validator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController(text: "");
  final TextEditingController emailcontroller = TextEditingController(text: "");
  final TextEditingController passwordcontroller = TextEditingController(
      text: "");
  final TextEditingController cpasswordcontroller = TextEditingController(
      text: "");
  final AuthController controller = Get.put(AuthController());

  void sign_up() {
    if (_form.currentState!.validate()) {
      controller.register(
          namecontroller.text,
          emailcontroller.text,
          passwordcontroller.text
      );
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
    cpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/JP.png",
                  width: 100,
                  height: 100,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      Text(
                          "Get started with JP's Scholarship Platform."
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AuthInput(
                  label: "Name",
                  hintText: "Enter your name",
                  controller: namecontroller,
                  validatorCallback: ValidationBuilder().required()
                      .minLength(3)
                      .maxLength(50)
                      .build(),
                ),
                const SizedBox(height: 20),
                AuthInput(
                  label: "Email",
                  hintText: "Enter your email",
                  controller: emailcontroller,
                  validatorCallback: ValidationBuilder().required()
                      .email()
                      .build(),
                ),
                const SizedBox(height: 20),
                AuthInput(
                  label: "Password",
                  hintText: "Enter your password",
                  controller: passwordcontroller,
                  isPasswordField: true,
                  validatorCallback: ValidationBuilder().required()
                      .minLength(8)
                      .maxLength(50)
                      .build(),
                ),
                const SizedBox(height: 20,),
                AuthInput(
                  label: "Confirm Password",
                  hintText: "Confirm your password",
                  controller: cpasswordcontroller,
                  validatorCallback: (arg) {
                    if (passwordcontroller.text != arg) {
                      return "Confirm password doesnot match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                Obx(() {
                  return ElevatedButton(
                      onPressed: sign_up,
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(
                          const Size.fromHeight(40),
                        ),
                      ),
                      child: Text(controller.registerLoading.value ? "Processing.." : "Sign up")
                  );
                }),
                const SizedBox(height: 20,),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "  Login",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(RouteNames.login)
                      )
                    ],
                    text: "Already have an account!"
                ),
                ),
              ],
            ),
          ),
        ),
      )
      ),
    );
  }
}
