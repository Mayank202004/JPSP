import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpss/routes/route_names.dart';
import '../../controllers/profileController.dart';

class PastQualificationScreen extends StatelessWidget {
  PastQualificationScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<ProfileController>();
  final picker = ImagePicker();

  final List<String> completeTypes = ['Completed', 'Pursuing'];

  Widget _buildStepIndicator(int step, String title, String routeName) {
    return GestureDetector(
      onTap: () => Get.offNamed(routeName),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: step == 4 ? Colors.blue : Colors.grey[300],
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
    final pq = controller.pastQualifications;

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
                  _buildStepIndicator(1, "Personal", RouteNames.personalDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(2, "Address", RouteNames.addressDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(3, "Education", RouteNames.educationalDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(4, "PastQualifications", RouteNames.pastqualification),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(5, "Domicile", RouteNames.domicileDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(6, "Income", RouteNames.incomeDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(7, "Bank", RouteNames.bankDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(8, "Parents", RouteNames.parentDetails),
                  Container(width: 30, height: 3, color: Colors.grey),
                  _buildStepIndicator(9, "Hostel", RouteNames.hostelDetails),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.school, size: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text("Past Qualifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _buildTextField("Qualification Level", (val) => pq.qualificationLevel = val),
                      _buildTextField("Stream", (val) => pq.stream = val),
                      _buildDropdown("Completed / Pursuing", completeTypes, (val) => pq.completed = val),
                      _buildTextField("Institute Name", (val) => pq.instituteName = val),
                      _buildTextField("Institute State", (val) => pq.instituteState = val),
                      _buildTextField("Institute District", (val) => pq.instituteDistrict = val),
                      _buildTextField("Institute City", (val) => pq.instituteCity = val),
                      _buildTextField("Institute Taluka", (val) => pq.instituteTaluka = val),
                      _buildTextField("Course", (val) => pq.course = val),
                      _buildTextField("Board / University", (val) => pq.boardUniversity = val),
                      _buildTextField("Admission Year", (val) => pq.admissionYear = val),
                      _buildTextField("Passing Year", (val) => pq.passingYear = val),
                      _buildTextField("Result", (val) => pq.result = val),
                      _buildTextField("Percentage", (val) => pq.percentage = double.tryParse(val)),
                      _buildTextField("Attempts", (val) => pq.attempts = int.tryParse(val)),
                      _buildTextField("Gap Years", (val) => pq.gapYears = int.tryParse(val)),
                      const SizedBox(height: 20),
                      StatefulBuilder(
                        builder: (context, setState) => Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                final picked = await picker.pickImage(source: ImageSource.gallery);
                                if (picked != null) {
                                  pq.certificate = picked.path;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.upload_file),
                              label: const Text("Upload Certificate"),
                            ),
                            const SizedBox(width: 10),
                            if (pq.certificate != null)
                              const Icon(Icons.check_circle, color: Colors.green)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => Get.toNamed(RouteNames.educationalDetails),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                            child: const Text("Previous", style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.toNamed(RouteNames.domicileDetails);
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            child: const Text("Save", style: TextStyle(color: Colors.white)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.toNamed(RouteNames.domicileDetails);
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            child: const Text("Next", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, Function(String) onChanged, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdown(String hint, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        items: items.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
        validator: (value) => value == null ? 'Please select' : null,
        onChanged: onChanged,
      ),
    );
  }
}
