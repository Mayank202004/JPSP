import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/auth/register.dart';
import '../../widets/transformer.dart';

import 'login.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController(text: "");
  final TextEditingController usernamecontroller = TextEditingController(text: "");
  final TextEditingController passwordcontroller = TextEditingController(text: "");
  final TextEditingController namecontroller = TextEditingController(text: "");
  final TextEditingController cpasswordcontroller = TextEditingController(text: "");
  bool isLogin = true; // Track if the dialog is for Login or Register

  void login() {
    if (_form.currentState!.validate()) {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 100),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: const Transformer(),
          ),
          Stack(
            children: [
              ClipPath(
                clipper: BezierClipper(),
                child: Container(
                  height: 450,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight),
                  ),
                ),
              ),
              Positioned(
                top: context.height * 0.45,
                right: context.width * 0.30,
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Colors.transparent)),
                    onPressed: () {
                      showSignInDialog(context); // Show Sign In dialog
                    },
                    child: const Row(
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to show SignIn dialog
  void showSignInDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Sign In",
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Welcome back JP's Scholarship Platform.\nAn AI powered paperless scholarship distribution system",
                    textAlign: TextAlign.center,
                  ),
                ),
                SignInForm(
                  emailController: emailcontroller,
                  passwordController: passwordcontroller,
                ),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "  Register",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              clearControllers();
                              Navigator.of(context).pop(); // Close the dialog
                              showRegisterDialog(context);
                            })
                    ],
                    text: "Don't have an account ?"
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to show Register dialog
  void showRegisterDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Register",
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 800,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Create an account to get started with JP's Scholarship Platform.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RegisterForm(
                    emailController: emailcontroller,
                    passwordController: passwordcontroller,
                    nameController: namecontroller,
                    cpasswordController: cpasswordcontroller,
                    usernameController: usernamecontroller,
                  ),
                  Text.rich(TextSpan(
                      children: [
                        TextSpan(text: "  Login",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                clearControllers();
                                Navigator.of(context).pop(); // Close the dialog
                                showSignInDialog(context);
                              })
                      ],
                      text: "Already have an account!"
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clearControllers(){
    namecontroller.text="";
    usernamecontroller.text="";
    emailcontroller.text="";
    passwordcontroller.text="";
    cpasswordcontroller.text="";
  }
}



// For curve
class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.50);

    path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.2);

    path.quadraticBezierTo(
        size.width * 0.85,
        size.height * 0,
        size.width,
        size.height * 0.0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}


