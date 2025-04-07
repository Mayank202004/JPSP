import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';

import '../../controllers/profileController.dart';
import '../../models/profileModel.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetailsScreen> {
  final profileController = Get.find<ProfileController>();
  int currentStep = 1;

  final List<String> genderTypes = ['Male', 'Female', 'Other'];
  final List<String> marriedTypes = ['Married', 'Unmarried'];

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

    // Ensure personalDetails is not null
    profile.personalDetails ??= PersonalDetails();

    final pd = profile.personalDetails!;

    final fieldMapping = {
      "Full Name": (String val) => pd.fullName = val,
      "Date of Birth": (String val) => pd.dob = val,
      "Age": (String val) => pd.age = int.tryParse(val),
      "Aadhar Number": (String val) => pd.aadharNumber = val,
      "Mobile Number": (String val) => pd.mobile = val,
      "Parent's Mobile Number": (String val) => pd.parentMobile = val,
      "Religion": (String val) => pd.religion = val,
      "Caste Category": (String val) => pd.casteCategory = val,
      "E-mail ID": (String val) => pd.email = val,
    };

    final initialValues = {
      "Full Name": pd.fullName,
      "Date of Birth": pd.dob,
      "Age": pd.age?.toString(),
      "Aadhar Number": pd.aadharNumber,
      "Mobile Number": pd.mobile,
      "Parent's Mobile Number": pd.parentMobile,
      "Religion": pd.religion,
      "Caste Category": pd.casteCategory,
      "E-mail ID": pd.email,
    };


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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 10),
                    const Text("Personal Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // Text fields
                    ...fieldMapping.entries.map((entry) {
                      final label = entry.key;

                      if (label == "Date of Birth") {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text("Date of Birth", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    // Set a default initial date (e.g., 18 years ago)
                                    initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    // Optionally, calculate age based on the selected date.
                                    final calculatedAge = DateTime.now().year - pickedDate.year -
                                        ((DateTime.now().month < pickedDate.month ||
                                            (DateTime.now().month == pickedDate.month &&
                                                DateTime.now().day < pickedDate.day))
                                            ? 1
                                            : 0);
                                    setState(() {
                                      pd.dob = pickedDate.toIso8601String();
                                    });
                                  }
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: TextEditingController(
                                      text: pd.dob != null && pd.dob!.isNotEmpty
                                          ? profileController.pickedDateToFormattedDate(pd.dob!)
                                          : "",
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Select Date of Birth",
                                      suffixIcon: const Icon(Icons.calendar_today),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      // Return the default text field for all other fields.
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
                    }).toList(),


                    // Gender
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Gender",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: "Gender",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            value: pd.gender,
                            items: genderTypes.map((gender) => DropdownMenuItem(value: gender, child: Text(gender))).toList(),
                            onChanged: (value) {
                              setState(() {
                                pd.gender = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Marital Status
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Marital Status",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: "Marital Status",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            value: pd.maritalStatus,
                            items: marriedTypes.map((status) => DropdownMenuItem(value: status, child: Text(status))).toList(),
                            onChanged: (value) {
                              setState(() {
                                pd.maritalStatus = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                          child: const Text("Previous", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.addressDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text("Next", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
