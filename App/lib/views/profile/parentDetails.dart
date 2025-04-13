import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';

import '../../controllers/profileController.dart';
import '../../models/profileModel.dart';

class ParentDetailsScreen extends StatefulWidget {
  const ParentDetailsScreen({super.key});

  @override
  State<ParentDetailsScreen> createState() => _ParentDetailsScreenState();
}

class _ParentDetailsScreenState extends State<ParentDetailsScreen> {
  final profileController = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  int currentStep = 8;

  final List<String> yesNoOptions = ['Yes', 'No'];

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

    profile.parentsDetails ??= ParentsDetails();
    final pd = profile.parentsDetails!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.family_restroom, size: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text("Parents Information",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Is Father Alive?", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: "Is Father Alive?",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            value: pd.isFatherAlive == null
                                ? null
                                : (pd.isFatherAlive! ? 'Yes' : 'No'),
                            items: yesNoOptions
                                .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                pd.isFatherAlive = value == 'Yes';
                              });
                            },
                            validator: (value) =>
                            value == null ? 'Please select an option' : null,
                          ),

                          Visibility(
                            visible: pd.isFatherAlive == true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("Father's Name", style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                TextFormField(
                                  initialValue: pd.fatherName,
                                  decoration: InputDecoration(
                                    hintText: "Father's Name",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onChanged: (val) => pd.fatherName = val,
                                  validator: (val) {
                                    if (pd.isFatherAlive == true && (val == null || val.trim().isEmpty)) {
                                      return "Father's name is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("Father's Occupation", style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                TextFormField(
                                  initialValue: pd.fatherOccupation,
                                  decoration: InputDecoration(
                                    hintText: "Father's Occupation",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onChanged: (val) => pd.fatherOccupation = val,
                                  validator: (val) {
                                    if (pd.isFatherAlive == true && (val == null || val.trim().isEmpty)) {
                                      return "Father's occupation is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("Is Father Salaried?", style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    hintText: "Is Father Salaried?",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  value: pd.isFatherSalaried == null
                                      ? null
                                      : (pd.isFatherSalaried! ? 'Yes' : 'No'),
                                  items: yesNoOptions
                                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      pd.isFatherSalaried = value == 'Yes';
                                    });
                                  },
                                  validator: (value) {
                                    if (pd.isFatherAlive == true && value == null) {
                                      return "Please select an option";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Is Mother Alive?", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: "Is Mother Alive?",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            value: pd.isMotherAlive == null
                                ? null
                                : (pd.isMotherAlive! ? 'Yes' : 'No'),
                            items: yesNoOptions
                                .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                pd.isMotherAlive = value == 'Yes';
                              });
                            },
                            validator: (value) =>
                            value == null ? 'Please select an option' : null,
                          ),

                          Visibility(
                            visible: pd.isMotherAlive == true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("Mother's Name", style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                TextFormField(
                                  initialValue: pd.motherName,
                                  decoration: InputDecoration(
                                    hintText: "Mother's Name",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onChanged: (val) => pd.motherName = val,
                                  validator: (val) {
                                    if (pd.isMotherAlive == true && (val == null || val.trim().isEmpty)) {
                                      return "Mother's name is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("Mother's Occupation", style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                TextFormField(
                                  initialValue: pd.motherOccupation,
                                  decoration: InputDecoration(
                                    hintText: "Mother's Occupation",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onChanged: (val) => pd.motherOccupation = val,
                                  validator: (val) {
                                    if (pd.isMotherAlive == true && (val == null || val.trim().isEmpty)) {
                                      return "Mother's occupation is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("Is Mother Salaried?", style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    hintText: "Is Mother Salaried?",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  value: pd.isMotherSalaried == null
                                      ? null
                                      : (pd.isMotherSalaried! ? 'Yes' : 'No'),
                                  items: yesNoOptions
                                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      pd.isMotherSalaried = value == 'Yes';
                                    });
                                  },
                                  validator: (value) {
                                    if (pd.isMotherAlive == true && value == null) {
                                      return "Please select an option";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                profileController.addParentDetails();
                              }
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
            ),
          ],
        ),
      ),
    );
  }
}
