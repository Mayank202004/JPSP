import 'package:flutter/material.dart';

class MyAppliedSchemes extends StatelessWidget {
  const MyAppliedSchemes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Applied Schemes"),
      ),
      body: SingleChildScrollView(
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
