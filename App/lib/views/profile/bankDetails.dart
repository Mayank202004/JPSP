import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/controllers/profileController.dart';
import 'package:jpss/models/profileModel.dart';
import 'package:jpss/routes/route_names.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final profileController = Get.find<ProfileController>();
  int currentStep = 7;

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
    profile.bankDetails ??= BankDetails();
    final bank = profile.bankDetails!;

    final fieldMapping = {
      "Account Number": (String val) => bank.accountNumber = val,
      "IFSC Code": (String val) => bank.ifsc = val,
      "Bank Name": (String val) => bank.bankName = val,
      "Bank Branch Location": (String val) => bank.branchName = val,
    };

    final initialValues = {
      "Account Number": bank.accountNumber,
      "IFSC Code": bank.ifsc,
      "Bank Name": bank.bankName,
      "Bank Branch Location": bank.branchName,
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Stepper Row
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

            // Main Form Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.account_balance, size: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text("Bank Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    ...fieldMapping.entries.map((entry) {
                      final label = entry.key;
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
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

                    // Navigation Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.incomeDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                          child: const Text("Previous", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.parentDetails),
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
