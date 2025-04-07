import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpss/routes/route_names.dart';
import '../../controllers/profileController.dart';

class EducationalDetails extends StatelessWidget {
  EducationalDetails({super.key});

  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<ProfileController>();
  final picker = ImagePicker();

  final List<String> streamTypes = ['Arts', 'Engineering', 'Commerce', 'Agriculture'];
  final List<String> yearTypes = ['First Year', 'Second Year', 'Third Year', 'Fourth Year'];
  final List<String> completeTypes = ['Completed', 'Pursuing'];
  final List<String> admissionTypes = ['Centralized', 'Institute Level'];
  final List<String> reservationTypes = ['Open', 'SC', 'ST', 'OBC', 'EWS'];
  final List<String> modes = ['Online', 'Offline'];

  final int currentStep = 3;

  Widget _buildStepIndicator(int step, String title, String routeName) {
    return GestureDetector(
      onTap: () => Get.offNamed(routeName),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: currentStep == step ? Colors.blue : Colors.grey[300],
            radius: 20,
            child: Text("$step", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Future<void> _pickCertificate() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      controller.currentQualification.certificate = picked.path;
      controller.update(); // Manually trigger UI update if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final edu = controller.currentQualification!;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Step Indicator
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.school, size: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text("Current Course", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),

                      // Fields
                      _buildDropdown("Current Stream", streamTypes, (val) => edu.stream = val),
                      _buildTextField("Institute Name", (val) => edu.instituteName = val),
                      _buildTextField("Institute State", (val) => edu.instituteState = val),
                      _buildTextField("Institute District", (val) => edu.instituteDistrict = val),
                      _buildTextField("Institute City", (val) => edu.instituteCity = val),
                      _buildTextField("Institute Taluka", (val) => edu.instituteTaluka = val),
                      _buildTextField("Admission Year", (val) => edu.admissionYear = val, type: TextInputType.number),
                      _buildDropdown("Year of Study", yearTypes, (val) => edu.yearOfStudy = yearTypes.indexOf(val!) + 1),
                      _buildDropdown("Completed / Pursuing", completeTypes, (val){edu.completed = val;controller.completed.value=!controller.completed.value;}),
                      _buildDropdown("Admission Type", admissionTypes, (val) => edu.admissionType = val),
                      _buildDropdown("Admission Reservation", reservationTypes, (val) => edu.admissionReservation = val),
                      _buildDropdown("Mode", modes, (val) => edu.mode = val),
                      _buildTextField("Merit Percentile", (val) => edu.meritPercentile = double.tryParse(val), type: TextInputType.number),
                      _buildTextField("CAP ID", (val) => edu.capId = val),
                      Obx(()=> Visibility(
                            visible: controller.completed.value,
                            child: _buildTextField("Result", (val) => edu.result = val)),
                      ),
                      _buildTextField("Percentage", (val) => edu.percentage = double.tryParse(val), type: TextInputType.number),
                      _buildTextField("Gap Years", (val) => edu.gapYears = int.tryParse(val), type: TextInputType.number),

                      const SizedBox(height: 15),

                      // Certificate Upload (StatefulBuilder)
                      StatefulBuilder(
                        builder: (context, setState) => Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                final picked = await picker.pickImage(source: ImageSource.gallery);
                                if (picked != null) {
                                  edu.certificate = picked.path;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.upload_file),
                              label: const Text("Upload Certificate"),
                            ),
                            const SizedBox(width: 10),
                            if (edu.certificate != null)
                              const Icon(Icons.check_circle, color: Colors.green)
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => Get.toNamed(RouteNames.addressDetails),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                            child: const Text("Previous", style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.toNamed(RouteNames.pastqualification);
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            child: const Text("Next", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      )
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

  Widget _buildTextField(String hint, Function(String) onChanged, {TextInputType type = TextInputType.text,String initialValue = "",}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        initialValue: initialValue,
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
