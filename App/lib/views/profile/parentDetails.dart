import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';

class ParentDetails extends StatefulWidget {
  const ParentDetails({super.key});

  @override
  State<ParentDetails> createState() => _ParentDetailsState();
}

class _ParentDetailsState extends State<ParentDetails> {
  int currentStep = 7;
  String? aliveType;
  final List<String> aliveTypes = ['Yes', 'No'];
  String? salaryType;
  final List<String> salaryTypes = ['Yes', 'No'];

  Widget _buildStepIndicator(int step, String title,String routeName) {
    return GestureDetector(
      onTap: () {
        Get.offNamed(routeName);
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: currentStep == step ? Colors.blue : Colors.grey[300],
            radius: 20,
            child: Text("$step", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStepIndicator(1, "Personal",RouteNames.personalDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(2, "Address",RouteNames.addressDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(3, "Education",RouteNames.educationalDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(4, "Domicile",RouteNames.domicileDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(5, "Income",RouteNames.incomeDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(6, "Bank",RouteNames.bankDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(7, "Parents",RouteNames.parentDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(8, "Hostel",RouteNames.hostelDetails),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.family_restroom, size: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text("Parents Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ...[
                      "Is Father Alive",
                      "Father's Name",
                      "Father's Occupation",
                      "Is Father Salaried",
                      "Father's Salary",
                      "Is Mother Alive",
                      "Mother's Name",
                      "Mother's Occupation",
                      "Is Mother Salaried",
                      "Mother's Salary"
                    ].map((hint) => Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: hint.contains("Is ")
                          ? DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: hint,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        value: hint.contains("Father") ? aliveType : salaryType,
                        items: aliveTypes
                            .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (hint.contains("Father")) {
                              aliveType = value;
                            } else {
                              salaryType = value;
                            }
                          });
                        },
                      )
                          : TextField(
                        decoration: InputDecoration(
                          hintText: hint,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    )),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.bankDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                          child: const Text("Prev", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.hostelDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text("Next", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}