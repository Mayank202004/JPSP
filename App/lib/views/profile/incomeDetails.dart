import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpss/routes/route_names.dart';

import '../../controllers/profileController.dart';
import '../../models/profileModel.dart';

class IncomeDetailsScreen extends StatefulWidget {
  const IncomeDetailsScreen({super.key});

  @override
  State<IncomeDetailsScreen> createState() => _IncomeDetailsScreenState();
}

class _IncomeDetailsScreenState extends State<IncomeDetailsScreen> {
  final profileController = Get.find<ProfileController>();
  int currentStep = 6;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileController.profileModel.incomeDetails?.incomeCertificate = image.name;
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
    profile.incomeDetails ??= IncomeDetails();
    final inc = profile.incomeDetails!;

    final fieldMapping = {
      "Family Income in Rs": (String val) => inc.familyIncome = int.tryParse(val),
      "Income Certificate Number": (String val) => inc.incomeCertificateNumber = val,
      "Income Issuing Authority": (String val) => inc.incomeIssuingAuthority = val,
      "Income Certificate Issued Date": (String val) => inc.incomeCertificateIssuedDate = val,
    };

    final initialValues = {
      "Family Income in Rs": inc.familyIncome.toString(),
      "Income Certificate Number": inc.incomeCertificateNumber,
      "Income Issuing Authority": inc.incomeIssuingAuthority,
      "Income Certificate Issued Date": inc.incomeCertificateIssuedDate,
    };

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
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.info, size: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text("Income Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // Income Certificate Image Picker
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Income Certificate",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          TextField(
                            readOnly: true,
                            controller: TextEditingController(text: inc.incomeCertificate),
                            decoration: InputDecoration(
                              hintText: "Income Certificate",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                              suffixIcon: GestureDetector(
                                onTap: _pickImage,
                                child: const Icon(Icons.image_outlined, size: 30, color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Other Income Fields
                    ...fieldMapping.entries.map((entry) {
                      final label = entry.key;
                      if (label == "Income Certificate Issued Date") {
                        return Padding(
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
                                  inc.incomeCertificateIssuedDate = pickedDate.toIso8601String();
                                });
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                AbsorbPointer(
                                  child: TextFormField(
                                    controller: TextEditingController(
                                      text: profileController.pickedDateToFormattedDate(inc.incomeCertificateIssuedDate ?? ""),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: label,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                      suffixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(label,style: const TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            TextFormField(
                              initialValue: initialValues[label],
                              decoration: InputDecoration(
                                hintText: label,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              onChanged: entry.value,
                            ),
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.domicileDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                          child: const Text("Previous", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            profileController.addIncomeDetails();
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text("Save and Next", style: TextStyle(color: Colors.white)),
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
