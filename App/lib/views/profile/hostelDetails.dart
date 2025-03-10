
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/routes/route.dart';

class hostelDetails extends StatefulWidget {
  const hostelDetails({super.key});

  @override
  State<hostelDetails> createState() => _ProfileState();
}

class _ProfileState extends State<hostelDetails> {
  String? hostelType;
  final List<String> hostelTypes = ['Government','Non-Government'];
  String? meassavailableType;
  final List<String> messavailableTypes = ['Yes','No'];

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
                      child: Icon(Icons.account_balance,size: 50,),),
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hostel Details Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Hostel type",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        value: hostelType,
                        items: hostelTypes
                            .map((hostelTypes) => DropdownMenuItem(
                          value: hostelTypes,
                          child: Text(hostelTypes),
                        ))
                            .toList(),
                        onChanged: (value) {
                          hostelType = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Hostel Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Hostel Fees",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Is Mess Available",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        value: meassavailableType,
                        items: messavailableTypes
                            .map((messavailableTypes) => DropdownMenuItem(
                          value: messavailableTypes,
                          child: Text(messavailableTypes),
                        ))
                            .toList(),
                        onChanged: (value) {
                          meassavailableType = value;
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(decoration: InputDecoration(hintText: "Mess Fees",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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
                      ElevatedButton(
                          onPressed: (){
                            Get.toNamed(RouteNames.parentDetails);
                          },
                          child: Text("prev")),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text("Submit")),
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
