

import 'package:flutter/material.dart';

class MultiStepForm{
  static Widget personalInfo(){
    String? genderType;
    final List<String> genderTypes = ['Male', 'Female', 'Other'];
    String? marriedType;
    final List<String> marriedTypes = ['Married', 'Unmarried'];
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.person,size: 50,),),
          ],
        ),
        const SizedBox(height: 5,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Personal Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 0,),
        TextButton(
          onPressed: () {  },
          child:
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Upload Aadhar Card",style: TextStyle(fontSize: 18),),
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
              child: TextField(decoration: InputDecoration(hintText: "Date Of Birth",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Age",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Aadhar Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Aadhar Card",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Gender",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: genderType,
                items: genderTypes
                    .map((genderTypes) => DropdownMenuItem(
                  value: genderTypes,
                  child: Text(genderTypes),
                ))
                    .toList(),
                onChanged: (value) {
                  genderType = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Mobile Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Parent's Mobile Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Martial Status",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: marriedType,
                items: marriedTypes
                    .map((marriedTypes) => DropdownMenuItem(
                  value: marriedTypes,
                  child: Text(marriedTypes),
                ))
                    .toList(),
                onChanged: (value) {
                  marriedType = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Religion",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Caste Category",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "E-mail Id",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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
              ElevatedButton(onPressed: (){}, child: Text("Save")),
              ElevatedButton(onPressed: (){}, child: Text("Next"))
            ],
          ),
        )
      ],
    );
  }

  static Widget otherInfo(){
    return Column(
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
            Text("Other Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 5,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Family Income in Rs",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Income Certificate Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Income Issuing Authority",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(decoration: InputDecoration(hintText: "Income Certificate Issued Date",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
                ),
              ],
            ),
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
              ElevatedButton(onPressed: (){}, child: Text("Save")),
              ElevatedButton(onPressed: (){}, child: Text("Next"))
            ],
          ),
        )
      ],
    );
  }


  static Widget bankInfo(){
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.account_balance,size: 50,),),
          ],
        ),
        const SizedBox(height: 5,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bank Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 5,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Account Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "IFSC Code",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Bank Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(decoration: InputDecoration(hintText: "Bank Branch Location",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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
              ElevatedButton(onPressed: (){}, child: Text("Save")),
              ElevatedButton(onPressed: (){}, child: Text("Next"))
            ],
          ),
        )
      ],
    );
  }

  static Widget parentsInfo(){
    String? aliveType;
    final List<String> aliveTypes = ['Yes','No'];
    String? salaryType;
    final List<String> salaryTypes = ['Yes','No'];
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.family_restroom,size: 50,),),
          ],
        ),
        const SizedBox(height: 5,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Parents Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 5,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Is Father Alive",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: aliveType,
                items: aliveTypes
                    .map((aliveTypes) => DropdownMenuItem(
                  value: aliveTypes,
                  child: Text(aliveTypes),
                ))
                    .toList(),
                onChanged: (value) {
                  aliveType = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Father's Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Father's Occupation",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Is Father Salaried",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: salaryType,
                items: salaryTypes
                    .map((salaryTypes) => DropdownMenuItem(
                  value: salaryTypes,
                  child: Text(salaryTypes),
                ))
                    .toList(),
                onChanged: (value) {
                  salaryType = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Father's Salary",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Is Mother Alive",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: aliveType,
                items: aliveTypes
                    .map((aliveTypes) => DropdownMenuItem(
                  value: aliveTypes,
                  child: Text(aliveTypes),
                ))
                    .toList(),
                onChanged: (value) {
                  aliveType = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Mother's Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Mother's Occupation",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Is Mother Salired",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: salaryType,
                items: salaryTypes
                    .map((salaryTypes) => DropdownMenuItem(
                  value: salaryTypes,
                  child: Text(salaryTypes),
                ))
                    .toList(),
                onChanged: (value) {
                  salaryType = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(decoration: InputDecoration(hintText: "Mother's Salary",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
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


  static Widget hostelInfo(){
    String? hostelType;
    final List<String> hostelTypes = ['Government','Non-Government'];
    String? meassavailableType;
    final List<String> messavailableTypes = ['Yes','No'];
    return Column(
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
              ElevatedButton(onPressed: (){}, child: Text("Save")),
              ElevatedButton(onPressed: (){}, child: Text("Next"))
            ],
          ),
        )
      ],
    );
  }


}