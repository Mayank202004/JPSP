import 'package:flutter/material.dart';
import 'package:jpss/views/drawerView/drawerView.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/routes/route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final username = GetStorage().read('username') ?? 'Scholar';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome $username!",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const Text("Profile Completeness"),
              Stack(
                children: [
                  Container(
                    width: 250 ,
                    height: 15,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                  ),
                  Container(
                    width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,),borderRadius: BorderRadius.circular(20)),
                  ),

                ],

              )
              
            ],
          ),
      ),
      drawer: const DrawerView()
    );
  }
}
