import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jpss/controllers/scholarshipController.dart';

class ScholarshipDetailScreen extends StatelessWidget {
  const ScholarshipDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScholarshipController controller = Get.find();
    final int index = Get.arguments['index']; // Get index from arguments
    final scholarship = controller.scholarships[index];

    // Format date
    String deadline = scholarship.deadline != null
        ? DateFormat('dd MMM yyyy').format(DateTime.parse(scholarship.deadline!))
        : 'N/A';

    int daysLeft = scholarship.deadline != null
        ? DateTime.parse(scholarship.deadline!).difference(DateTime.now()).inDays
        : -1;

    return Scaffold(
      appBar: AppBar(
        title: Text(scholarship.title ?? 'Scholarship Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              scholarship.title ?? 'Unknown Scholarship',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 8),

            // Provider Info
            _infoCard(
              icon: Icons.account_balance,
              title: "Provider",
              subtitle: scholarship.provider?.name ?? 'N/A',
            ),

            // Deadline Info
            _infoCard(
              icon: Icons.calendar_today,
              title: "Deadline",
              subtitle: deadline,
              trailing: daysLeft >= 0
                  ? Text(
                "$daysLeft days left",
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
                  : null,
            ),

            // Status Indicator
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: scholarship.status == 'Open' ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: scholarship.status == 'Open' ? Colors.green : Colors.red, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      scholarship.status == 'Open' ? Icons.check_circle : Icons.cancel,
                      color: scholarship.status == 'Open' ? Colors.green : Colors.red,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      scholarship.status ?? 'Unknown',
                      style: TextStyle(
                        color: scholarship.status == 'Open' ? Colors.green : Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Eligibility Section
            _sectionTitle(context,"Eligibility Criteria"),
            _infoCard(
              icon: Icons.school,
              title: "Academic Min. %: ${scholarship.eligibility?.academicCriteria?.minPercentage ?? 'N/A'}%",
            ),
            _infoCard(
              icon: Icons.category,
              title: "Caste Category",
              subtitle: scholarship.eligibility?.casteCategory ?? 'N/A',
            ),
            _infoCard(
              icon: Icons.attach_money,
              title: "Income Limit",
              subtitle: "₹${scholarship.eligibility?.incomeLimit ?? 'N/A'}",
            ),

            // Applicable Courses
            _sectionTitle(context,"Applicable Courses"),
            _chipList(scholarship.eligibility?.academicCriteria?.applicableCourses ?? []),

            // Documents Required
            _sectionTitle(context,"Documents Required"),
            _chipList(scholarship.documentsRequired ?? []),

            // Description
            _sectionTitle(context,"Description"),
            Text(
              scholarship.description ?? "No description available.",
              style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87,),
            ),

            const SizedBox(height: 20),

            // Apply Now Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar("Apply Now", "Scholarship application process will be implemented soon!",
                      backgroundColor: Colors.blueAccent, colorText: Colors.white);
                },
                icon: const Icon(Icons.send,color: Colors.white,),
                label: const Text("Apply Now"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Title
  // Section Title
  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
    );
  }


  // Information Card Widget
  Widget _infoCard({required IconData icon, required String title, String? subtitle, Widget? trailing}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing,
      ),
    );
  }

  // Chip List for Categories & Documents
  Widget _chipList(List<String> items) {
    return items.isNotEmpty
        ? Wrap(
      spacing: 8,
      children: items
          .map(
            (item) => Chip(
          label: Text(item, style: const TextStyle(fontSize: 14, color: Colors.white)),
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      )
          .toList(),
    )
        : const Text("No data available.", style: TextStyle(color: Colors.grey));
  }
}
