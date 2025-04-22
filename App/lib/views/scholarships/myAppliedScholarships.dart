import 'package:flutter/material.dart';
import 'package:jpss/controllers/mySchemesController.dart';
import 'package:get/get.dart';

class MyAppliedSchemes extends StatelessWidget {
  const MyAppliedSchemes({super.key});

  @override
  Widget build(BuildContext context) {
    MySchemesController controller = Get.put(MySchemesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Applied Schemes"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Text("My Applied Schemes"),
              )
            ],
          ),),
      ),
    );
  }
}
