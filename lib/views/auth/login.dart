import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pmsss/utils/helper.dart';
import 'package:pmsss/widets/auth_input.dart';
import 'package:get/get.dart';
import 'package:form_validator/form_validator.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/route_names.dart';
import 'package:pmsss/theme/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController(text: "");
  final TextEditingController passwordcontroller = TextEditingController(text: "");
  final AuthController controller = Get.put(AuthController());


  void login() {
    if(_form.currentState!.validate()){
      controller.login(
          emailcontroller.text,
          passwordcontroller.text
      );    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
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
                        "Login",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      Text(
                          "Welcome Back."
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AuthInput(
                  label: "Email",
                  hintText: "Enter your email",
                  controller: emailcontroller,
                  validatorCallback: ValidationBuilder().required().email().build(),
                ),
                const SizedBox(height: 20),
                AuthInput(
                  label: "Password",
                  hintText: "Enter your password",
                  isPasswordField: true,
                  controller: passwordcontroller,
                  validatorCallback: ValidationBuilder().required().minLength(8).maxLength(50).build(),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () => Get.toNamed(RouteNames.homePage),
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      const Size.fromHeight(40),
                    ),
                  ),
                  child: Text("Login"),
                ),
                const SizedBox(height: 20,),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "  Sign up",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(RouteNames.register)
                      ),
                    ],
                    text: "Don't have an account?")
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
