import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import '../../controllers/profileController.dart';
import '../displayDocument/displayDocument.dart';

class VerifyDetailsScreen extends StatelessWidget {
  final ProfileController profileController = Get.find();

  Widget buildField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              value ?? "-",
              maxLines: 3,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionCard(String title, List<Widget> fields, VoidCallback onEdit) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    )),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_note, color: Colors.blueAccent),
                ),
              ],
            ),
            const Divider(thickness: 1.2),
            const SizedBox(height: 8),
            ...fields,
          ],
        ),
      ),
    );
  }

  List<Widget> buildEducationList(String title, List educationList) {
    return educationList.asMap().entries.map((entry) {
      int index = entry.key;
      var edu = entry.value;

      return buildSectionCard("$title ${index + 1}", [
        buildField("Qualification Level", edu.qualificationLevel),
        buildField("Stream", edu.stream),
        buildField("Institute", edu.instituteName),
        buildField("Admission/Passing Year", edu.admissionYear?.toString() ?? edu.passingYear?.toString()),
        buildField("Result", edu.result),
        buildField("Percentage", edu.percentage?.toString()),
      ], () {
        profileController.jumpToPage(title == "Current Education" ? 2 : 5);
      });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final profile = profileController.profileModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Your Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            buildSectionCard("Personal Details", [
              buildField("Full Name", profile.personalDetails?.fullName),
              buildField("DOB", profileController.pickedDateToFormattedDate(profile.personalDetails!.dob ?? "")),
              buildField("Gender", profile.personalDetails?.gender),
              buildField("Adhaar Number", profile.personalDetails?.aadharNumber),
              TextButton(onPressed: (){
                Get.toNamed(RouteNames.displayDocument, arguments: {
                  'title': 'Uploaded Adhaar',
                  'imageUrl': profile.personalDetails?.aadharCard ?? "",
                });
              }, child: const Text("View Uploaded Adhaar")),
              buildField("Religion", profile.personalDetails?.religion),
              buildField("Caste Category", profile.personalDetails?.casteCategory),
              buildField("Marital Status", profile.personalDetails?.maritalStatus),
              buildField("Email ID", profile.personalDetails?.email),
              buildField("Parents Mobile", profile.personalDetails?.parentMobile),
              buildField("Mobile", profile.personalDetails?.mobile),
            ], () {
              Get.offNamedUntil(
                RouteNames.personalDetails,
                ModalRoute.withName(RouteNames.homePage),
              );
            }),

            buildSectionCard("Address Details", [
              buildField("State", profile.address?.state),
              buildField("District", profile.address?.district),
              buildField("Pincode", profile.address?.pincode),
            ], () {
              profileController.jumpToPage(1);
            }),

            if (profile.currentQualification != null && profile.currentQualification!.isNotEmpty)
              ...buildEducationList("Current Education", profile.currentQualification!),

            if (profile.pastQualifications != null && profile.pastQualifications!.isNotEmpty)
              ...buildEducationList("Past Qualification", profile.pastQualifications!),

            buildSectionCard("Income Details", [
              buildField("Annual Income", profile.incomeDetails?.familyIncome?.toString()),
              buildField("Certificate", profile.incomeDetails?.incomeCertificate),
            ], () {
              profileController.jumpToPage(3);
            }),

            buildSectionCard("Hostel Details", [
              buildField("Hostel Type", profile.hostelDetails?.hostelType),
              buildField("Mess Available", profile.hostelDetails?.isMessAvailable == true ? "Yes" : "No"),
            ], () {
              profileController.jumpToPage(4);
            }),

            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            // profileController.submitApplication();
          },
          icon: const Icon(Icons.check_circle_outline),
          label: const Text("Confirm & Submit"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
