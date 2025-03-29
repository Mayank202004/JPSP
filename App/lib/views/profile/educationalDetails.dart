import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/routes/route.dart';

class EducationalDetails extends StatefulWidget {
  const EducationalDetails({super.key});

  @override
  State<EducationalDetails> createState() => _EducationalDetailsState();
}

class _EducationalDetailsState extends State<EducationalDetails> {
  String? selectedYear;
  final List<String> yearTypes = ['First Year', 'Second Year', 'Third Year', 'Fourth Year'];

  String? selectedStream;
  final List<String> streamTypes = ['Arts', 'Engineering', 'Commerce', 'Agriculture'];

  String? completetype;
  final List<String> completeTypes = ['Completed', 'Pursuing'];

  int currentStep = 3;

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
            // Step Indicator at the top
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
                  _buildStepIndicator(4, "PastQualifications",RouteNames.pastqualification),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(5, "Domicile",RouteNames.domicileDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(6, "Income",RouteNames.incomeDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(7, "Bank",RouteNames.bankDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(8, "Parents",RouteNames.parentDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(9, "Hostel",RouteNames.hostelDetails),
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
                      child: Icon(Icons.school, size: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text("Current Curse", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Current Stream",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        value: selectedStream,
                        items: streamTypes.map((stream) => DropdownMenuItem(value: stream, child: Text(stream))).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedStream = value;
                          });
                        },
                      ),
                    ),
                    ...["Institute Name", "CET Merit Marks", "CAP ID", "Admission Year"].map((hint) => Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: hint,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Year Of Study",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        value: selectedYear,
                        items: yearTypes.map((stream) => DropdownMenuItem(value: stream, child: Text(stream))).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Completed or Continue",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        value: completetype,
                        items: completeTypes.map((stream) => DropdownMenuItem(value: stream, child: Text(stream))).toList(),
                        onChanged: (value) {
                          setState(() {
                            completetype = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.addressDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                          child: const Text("Previous", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.pastqualification),
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