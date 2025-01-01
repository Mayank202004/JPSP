import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: DatePickerTheme(data: DatePickerThemeData(), child: Te),
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
