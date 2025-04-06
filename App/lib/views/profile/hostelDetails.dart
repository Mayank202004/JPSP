import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';

import '../../controllers/profileController.dart';
import '../../models/profileModel.dart';

class HostelDetailsScreen extends StatefulWidget {
  const HostelDetailsScreen({super.key});

  @override
  State<HostelDetailsScreen> createState() => _HostelDetailsScreenState();
}

class _HostelDetailsScreenState extends State<HostelDetailsScreen> {
  final profileController = Get.find<ProfileController>();
  int currentStep = 9;

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
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = profileController.profileModel;
    profile.hostelDetails ??= HostelDetails();
    final hostel = profile.hostelDetails!;

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
                      child: Icon(Icons.account_balance, size: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text("Hostel Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // Hostel Type Dropdown
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Hostel Type",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        DropdownButtonFormField<String>(
                          value: hostel.hostelType,
                          items: ['Government', 'Non-Government'].map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          )).toList(),
                          decoration: InputDecoration(
                            hintText: "Hostel Type",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onChanged: (value) => setState(() => hostel.hostelType = value),
                        ),

                        const SizedBox(height: 10),

                        // Hostel Name
                        // TextFormField(
                        //   initialValue: hostel.,
                        //   decoration: InputDecoration(
                        //     hintText: "Hostel Name",
                        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        //   ),
                        //   onChanged: (val) => hostel.hostelName = val,
                        // ),

                        const SizedBox(height: 10),

                        // Hostel Fees
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Hostel Fees",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        TextFormField(
                          initialValue: hostel.hostelFees?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Hostel Fees",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onChanged: (val) => hostel.hostelFees = int.tryParse(val),
                        ),

                        const SizedBox(height: 10),

                        // Is Mess Available Dropdown
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Is Mess Available?",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        DropdownButtonFormField<String>(
                          value: hostel.isMessAvailable == null
                              ? null
                              : (hostel.isMessAvailable! ? 'Yes' : 'No'),
                          items: ['Yes', 'No'].map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          )).toList(),
                          decoration: InputDecoration(
                            hintText: "Is Mess Available",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              hostel.isMessAvailable = value == 'Yes';
                            });
                          },
                        ),


                        const SizedBox(height: 10),

                        // Mess Fees

                        Visibility(
                          visible: hostel.isMessAvailable == true,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text("Mess Fees",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              TextFormField(
                                initialValue: hostel.messFees?.toString(),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Mess Fees",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                onChanged: (val) => hostel.messFees = int.tryParse(val),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Navigation Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () => Get.toNamed(RouteNames.parentDetails),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                              child: const Text("Previous", style: TextStyle(color: Colors.black)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // You could add validation/submission logic here
                                Get.snackbar("Saved", "Hostel details submitted", backgroundColor: Colors.green, colorText: Colors.white);
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: const Text("Submit", style: TextStyle(color: Colors.white)),
                            ),
                          ],
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
