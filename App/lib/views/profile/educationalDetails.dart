
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/routes/route.dart';

class educationalDetails extends StatefulWidget {
  const educationalDetails({super.key});

  @override
  State<educationalDetails> createState() => _ProfileState();
}

class _ProfileState extends State<educationalDetails> {
  String? selectedCourseType;
  final List<String> courseTypes = ['Regular', 'Part-time', 'Online'];

  String? selectedyear;
  final List<String> yearTypes = ['First Year', 'Second Year', 'Third Year', 'Fourth Year'];

  String? selectedstream;
  final List<String> streamTypes = ['BTech in CSE', 'BTech in Civil Engineering'];

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
                      child: Icon(Icons.school, size: 50),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Educational Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Institute Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Your Stream",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        value: selectedstream,
                        items: streamTypes
                            .map((streamType) => DropdownMenuItem(
                          value: streamType,
                          child: Text(streamType),
                        ))
                            .toList(),
                        onChanged: (value) {
                          selectedstream = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Current Year",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        value: selectedyear,
                        items: yearTypes
                            .map((yearType) => DropdownMenuItem(
                          value: yearType,
                          child: Text(yearType),
                        ))
                            .toList(),
                        onChanged: (value) {
                          selectedyear = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "HSC Marks",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "SSC Marks",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Have you taken Drop (optional)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Admission Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Course Type",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        value: selectedCourseType,
                        items: courseTypes
                            .map((courseType) => DropdownMenuItem(
                          value: courseType,
                          child: Text(courseType),
                        ))
                            .toList(),
                        onChanged: (value) {
                          selectedCourseType = value;
                        },
                      ),
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
                            Get.toNamed(RouteNames.personalDetails);
                          },
                          label: Text("Prev")
                      ),
                      ElevatedButton.icon(
                          onPressed: (){
                            Get.toNamed(RouteNames.otherDetails);
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
