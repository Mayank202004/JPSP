

import 'package:flutter/material.dart';

class MultiStepForm{
  static Widget personalInfo(){
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.account_circle_sharp,size: 100,),),
          ],
        ),
        const SizedBox(height: 10,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Personal Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 10,),
        TextButton(
          onPressed: () {  },
          child:
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Upload Aadhar Card",style: TextStyle(fontSize: 20),),
              Icon(Icons.upload)],
          ),),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "First Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Middle Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Last Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Fathers Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Mothers Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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
    );
  }
  static Widget educationalInfo() {
    String? selectedCourseType;
    final List<String> courseTypes = ['Regular', 'Part-time', 'Online'];

    String? selectedyear;
    final List<String> yearTypes = ['First Year', 'Second Year', 'Third Year', 'Fourth Year'];

    String? selectedstream;
    final List<String> streamTypes = ['BTech in CSE', 'BTech in Civil Engineering'];

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.school_outlined, size: 60),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Educational Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ],
    );
  }
}