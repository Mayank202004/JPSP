import 'package:flutter/material.dart';

class Profile2 extends StatefulWidget {
  const Profile2({super.key});

  @override
  State<Profile2> createState() => _ProfileState();
}

class _ProfileState extends State<Profile2> {
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
                      child: Icon(Icons.school_outlined,size: 60,),),
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Educational Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Institue Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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
                            .map((streamTypes) => DropdownMenuItem(
                          value: streamTypes,
                          child: Text(streamTypes),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedstream = value;
                          });
                        },                      ),
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
                          setState(() {
                            selectedyear = value;
                          });
                        },                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "HSC Marks",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "SSC Marks",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Have you taken Drop(optional)",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Admission Date",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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
                          setState(() {
                            selectedCourseType = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(decoration: InputDecoration(hintText: "Admission Date",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("Save")),
                      ElevatedButton(onPressed: (){}, child: Text("Next"))
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
