import 'package:flutter/material.dart';
import 'package:jpss/views/drawerView/drawerView.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/routes/route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome Scholar!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const Text("Profile Completeness"),
              Stack(
                children: [
                  Container(
                    width: double.infinity ,
                    height: 15,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                  ),
                  Container(
                    width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,),borderRadius: BorderRadius.circular(20)),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                        onPressed: () => Get.toNamed(RouteNames.getStarted),
                        child: const Text("Log out")
                    ),
                  ),
                ],

              )
              
            ],
          ),
      ),
      drawer: DrawerView()
    );
  }
}
