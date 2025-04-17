import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route_names.dart';
import '../../controllers/profileController.dart';
import '../../models/profileModel.dart';
import '../displayDocument/displayDocument.dart';

class VerifyDetailsScreen extends StatelessWidget {
  final ProfileController profileController = Get.find();

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
              Get.toNamed(RouteNames.personalDetails);
            }),

            // Address Details
            buildSectionCard("Address Details", [
              buildField("Address", profile.address?.address),
              buildField("City", profile.address?.city),
              buildField("District", profile.address?.district),
              buildField("State", profile.address?.state),
              buildField("Pincode", profile.address?.pincode),
            ], () {
              Get.toNamed(RouteNames.addressDetails);
            }),

            // Domicile Details
            buildSectionCard("Domicile Details", [
              buildField("Certificate Number", profile.domicileDetails?.domicileCertificateNumber),
              buildField("Issuing Authority", profile.domicileDetails?.domicileIssuingAuthority),
              buildField("Issuing Date", profileController.pickedDateToFormattedDate(profile.domicileDetails?.domicileIssuingDate ?? "")),
              TextButton(onPressed: (){
                Get.toNamed(RouteNames.displayDocument, arguments: {
                  'title': 'Uploaded Domicile Certificate',
                  'imageUrl': profile.domicileDetails?.domicileCertificate ?? "",
                });
              }, child: const Text("View Uploaded Domicile")),
            ], () {
              Get.toNamed(RouteNames.domicileDetails);
            }),

            // Bank Details
            buildSectionCard("Bank Details", [
              buildField("Account Number", profile.bankDetails?.accountNumber),
              buildField("IFSC", profile.bankDetails?.ifsc),
              buildField("Bank Name", profile.bankDetails?.bankName),
              buildField("Branch Name", profile.bankDetails?.branchName),
            ], () {
              Get.toNamed(RouteNames.bankDetails);
            }),

            // Parent Details
            buildSectionCard("Parents Details", [
              buildField("Is Father Alive", profile.parentsDetails?.isFatherAlive == true ? "Yes" : "No"),
              if (profile.parentsDetails?.isFatherAlive == true) ...[
                buildField("Father's Name", profile.parentsDetails?.fatherName),
                buildField("Father's Occupation", profile.parentsDetails?.fatherOccupation),
                buildField("Is Father Salaried", profile.parentsDetails?.isFatherSalaried == true ? "Yes" : "No"),
              ],
              buildField("Is Mother Alive", profile.parentsDetails?.isMotherAlive == true ? "Yes" : "No"),
              if (profile.parentsDetails?.isMotherAlive == true) ...[
                buildField("Mother's Name", profile.parentsDetails?.motherName),
                buildField("Mother's Occupation", profile.parentsDetails?.motherOccupation),
                buildField("Is Mother Salaried", profile.parentsDetails?.isMotherSalaried == true ? "Yes" : "No"),
              ],
            ], () {
              Get.toNamed(RouteNames.parentDetails);
            }),


            if (profile.currentQualification != null && profile.currentQualification!.isNotEmpty)
              ...buildCurrentEducationList("Current Education", profile.currentQualification!),

            if (profile.pastQualifications != null && profile.pastQualifications!.isNotEmpty)
              ...buildEducationList("Past Qualification", profile.pastQualifications!),

            buildSectionCard("Income Details", [
              buildField("Annual Income", profile.incomeDetails?.familyIncome?.toString()),
              buildField("Income Certif No", profile.incomeDetails?.incomeCertificateNumber),
              buildField("Cert Issuing Authority", profile.incomeDetails?.incomeIssuingAuthority),
              buildField("Cert Issue Date", profileController.pickedDateToFormattedDate(profile.incomeDetails?.incomeCertificateIssuedDate ?? "")),
              TextButton(onPressed: (){
                Get.toNamed(RouteNames.displayDocument, arguments: {
                  'title': 'Uploaded Income Certificate',
                  'imageUrl': profile.incomeDetails?.incomeCertificate ?? "",
                });
              }, child: const Text("View Uploaded Income Certificate")),

            ], () {
              Get.toNamed(RouteNames.incomeDetails);
            }),

            // Hostel Details
            buildSectionCard("Hostel Details", [
              buildField("Hostel Category", profile.hostelDetails?.hostelCategory),
              buildField("Hostel Fees", profile.hostelDetails?.hostelFees?.toString()),
              buildField("Hostel Type", profile.hostelDetails?.hostelType),
              TextButton(onPressed: (){
                Get.toNamed(RouteNames.displayDocument, arguments: {
                  'title': 'Hostel Certificate',
                  'imageUrl': profile.hostelDetails?.hostelCertificate ?? "",
                });
              }, child: const Text("View Uploaded Hostel Certificate")),
              buildField("Is Mess Available", profile.hostelDetails?.isMessAvailable == true ? "Yes" : "No"),
              if (profile.hostelDetails?.isMessAvailable == true)
                buildField("Mess Fees", profile.hostelDetails?.messFees?.toString()),
            ], () {
              Get.toNamed(RouteNames.hostelDetails);
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


  /*
  * @desc Widget for Each field inside Section Card
  * */
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

  /*
  * @desc Widget for Each Section (Ex. Personal Details)
  * */
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

  /*
  * @desc Widget for Past Educational(Qualification) Details
  * */
  List<Widget> buildEducationList(String title, List educationList) {
    return educationList.asMap().entries.map((entry) {
      int index = entry.key;
      var edu = entry.value;

      return buildSectionCard("$title ${index + 1}", [
        buildField("Qualification Level", edu.qualificationLevel),
        buildField("Stream", edu.stream),
        buildField("Completed", edu.completed),
        buildField("Institute Name", edu.instituteName),
        buildField("Institute City", edu.instituteCity),
        buildField("Institute Taluka", edu.instituteTaluka),
        buildField("Institute District", edu.instituteDistrict),
        buildField("Institute State", edu.instituteState),
        buildField("Course", edu.course),
        buildField("Board / University", edu.boardUniversity),
        buildField("Admission Year", profileController.pickedDateToFormattedDate(edu.admissionYear)),
        buildField("Passing Year", profileController.pickedDateToFormattedDate(edu.passingYear)),
        buildField("Result", edu.result),
        buildField("Percentage", edu.percentage?.toString()),
        if (edu.result == "Passed")
          TextButton(
            onPressed: () {
              Get.toNamed(RouteNames.displayDocument, arguments: <String, String>{
                'title': 'Uploaded Certificate',
                'imageUrl': edu.certificate?.toString() ?? "",
              });

            },
            child: const Text("View Uploaded Certificate"),
          ),
        buildField("Attempts", edu.attempts.toString()),
        buildField("Was any Gaps", edu.wasAnyGaps==true ? "Yes" : "No"),
        buildField("Gap Years", edu.gapYears.toString()),
      ], () {
        Get.toNamed(RouteNames.pastqualification);
      });
    }).toList();
  }

  /*
  * @desc Widget for Current Educational Details
  * */
  List<Widget> buildCurrentEducationList(String title, List<CurrentQualification> educationList,){
    if (educationList.isEmpty) return [];
    final first = educationList.first;
    return [
      // Shared Institute Location Section
      buildSectionCard("$title Institute Details", [
        buildField("Institute Name", first.instituteName),
        buildField("State", first.instituteState),
        buildField("District", first.instituteDistrict),
        buildField("Taluka", first.instituteTaluka),
        buildField("City", first.instituteCity),
      ], () {
        Get.toNamed(RouteNames.educationalDetails);
      }),

      // Per-education Entry Section
      ...educationList.asMap().entries.map((entry) {
        final index = entry.key;
        final edu = entry.value;

        return buildSectionCard("$title ${index + 1}", [
          buildField("Qualification Level", edu.qualificationLevel),
          buildField("Stream", edu.stream),
          buildField("Admission Year", edu.admissionYear),
          buildField("Year of Study", edu.yearOfStudy?.toString()),
          buildField("Mode", edu.mode),
          buildField("Merit Percentile", edu.meritPercentile?.toString()),
          buildField("CAP ID", edu.capId),
          buildField("Admission Type", edu.admissionType),
          buildField("Reservation", edu.admissionReservation),
          buildField("Completed", edu.completed),
          buildField("Result", edu.result),
          buildField("Percentage", edu.percentage?.toString()),
          if (edu.result == "Passed")
            TextButton(
              onPressed: () {
                Get.toNamed(RouteNames.displayDocument, arguments: <String, String>{
                  'title': 'Uploaded Certificate',
                  'imageUrl': edu.certificate?.toString() ?? "",
                });
              },
              child: const Text("View Uploaded Certificate"),
            ),
          buildField("Gap Years", edu.gapYears?.toString()),
        ], () {
          Get.toNamed(RouteNames.educationalDetails);
        });
      }).toList()
    ];
  }
}
