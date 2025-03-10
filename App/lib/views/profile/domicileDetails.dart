
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/routes/route.dart';

class domicileDetails extends StatefulWidget {
  const domicileDetails({super.key});

  @override
  State<domicileDetails> createState() => _ProfileState();
}

class _ProfileState extends State<domicileDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.info,size: 50,),),
                  ],
                ),
                const SizedBox(height: 5,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Domicile Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 5,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Domicile Certificate",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Domicile Certificate Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Domicile Issuing Authority",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(decoration: InputDecoration(hintText: "Domicile Certificate Issued Date",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          onPressed: (){
                            Get.toNamed(RouteNames.educationalDetails);
                          },
                          label: Text("Prev")
                      ),
                      ElevatedButton.icon(
                          onPressed: (){
                            Get.toNamed(RouteNames.incomeDetails);
                          },
                          label: Text("Next")
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
