import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpss/routes/route_names.dart';

import '../../controllers/profileController.dart';
import '../../models/profileModel.dart';

class DomicileDetailsScreen extends StatefulWidget {
  const DomicileDetailsScreen({super.key});

  @override
  State<DomicileDetailsScreen> createState() => _DomicileDetailsScreenState();
}

class _DomicileDetailsScreenState extends State<DomicileDetailsScreen> {
  final profileController = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  int currentStep = 5;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileController.profileModel.domicileDetails?.domicileCertificate = image.name;
      });
    }
  }

  Widget _buildStepIndicator(int step, String title, String routeName) {
    return GestureDetector(
      onTap: () => Get.offNamed(routeName),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: currentStep == step ? Colors.blue : Colors.grey[300],
            radius: 20,
            child: Text(
              "$step",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = profileController.profileModel;
    profile.domicileDetails ??= DomicileDetails();
    final dom = profile.domicileDetails!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
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

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.info, size: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text("Domicile Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),

                      // Certificate picker
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          readOnly: true,
                          controller: TextEditingController(text: dom.domicileCertificate),
                          decoration: InputDecoration(
                            hintText: "Domicile Certificate",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            suffixIcon: GestureDetector(
                              onTap: _pickImage,
                              child: const Icon(Icons.image_outlined, size: 30, color: Colors.blue),
                            ),
                          ),
                          validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
                        ),
                      ),

                      // Certificate number
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          initialValue: dom.domicileCertificateNumber,
                          decoration: InputDecoration(
                            hintText: "Domicile Certificate Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
                          onChanged: (val) => dom.domicileCertificateNumber = val,
                        ),
                      ),

                      // Issuing authority
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          initialValue: dom.domicileIssuingAuthority,
                          decoration: InputDecoration(
                            hintText: "Domicile Issuing Authority",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
                          onChanged: (val) => dom.domicileIssuingAuthority = val,
                        ),
                      ),

                      // Issued date
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GestureDetector(
                          onTap: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                dom.domicileIssuingDate = pickedDate.toIso8601String();
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                text: profileController.pickedDateToFormattedDate(dom.domicileIssuingDate ?? ""),
                              ),
                              decoration: InputDecoration(
                                hintText: "Domicile Certificate Issued Date",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                suffixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
                              ),
                              validator: (value) => (dom.domicileIssuingDate == null || dom.domicileIssuingDate!.isEmpty)
                                  ? 'Required'
                                  : null,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Navigation buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => Get.toNamed(RouteNames.pastqualification),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                            child: const Text("Previous", style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.toNamed(RouteNames.incomeDetails);
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
}
