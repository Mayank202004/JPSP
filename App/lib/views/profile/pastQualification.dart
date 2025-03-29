import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:image_picker/image_picker.dart';

class Pastqualification extends StatefulWidget {
  const Pastqualification({super.key});

  @override
  State<Pastqualification> createState() => _PastQualificationState();
}

class _PastQualificationState extends State<Pastqualification> {
  String? selectedYear;
  final List<String> yearTypes = ['First Year', 'Second Year', 'Third Year', 'Fourth Year'];

  String? qualificationType;
  final List<String> qualificationTypes = ['Diploma Course', 'HSC', 'SSC', 'Ph.D' , 'Post Graduate' , 'Under Graduate'];

  String? selectedStream;
  final List<String> streamTypes = ['BTech in CSE', 'BTech in Civil Engineering'];

  int currentStep = 4;
  final TextEditingController _imageController = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageController.text = image.name;
      });
    }
  }

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
                  _buildStepIndicator(4, "PastQualifications",RouteNames.pastQualifications),
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
                    const Text("Past Qualifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Qualification level",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        value: qualificationType,
                        items: qualificationTypes.map((stream) => DropdownMenuItem(value: stream, child: Text(stream))).toList(),
                        onChanged: (value) {
                          setState(() {
                            qualificationType = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: _imageController,
                        decoration: InputDecoration(
                          hintText: "MarkSheet",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          suffixIcon: GestureDetector(
                            onTap: _pickImage,
                            child: const Icon(Icons.image_outlined, size: 30, color: Colors.blue),
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    ...["Marks Obtained in Precentage", "Have you taken Drop (optional)", "Admission Year", "Passing Year"].map((hint) => Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
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
                          onPressed: () => Get.toNamed(RouteNames.educationalDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                          child: const Text("Previous", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.domicileDetails),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: const Text("Save", style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(RouteNames.domicileDetails),
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