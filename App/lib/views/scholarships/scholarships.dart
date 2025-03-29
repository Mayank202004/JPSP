import 'package:flutter/material.dart';
import 'package:jpss/controllers/scholarshipController.dart';
import 'package:get/get.dart';
import 'package:jpss/models/scholarshipModel.dart';
import 'package:intl/intl.dart';

class Scholarships extends StatefulWidget {
  const Scholarships({super.key});

  @override
  State<Scholarships> createState() => _ScholarshipsState();
}

class _ScholarshipsState extends State<Scholarships> {
  final ScholarshipController controller = Get.put(ScholarshipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scholarships")),
      body: Obx(() {
        if (controller.scholarships.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.scholarships.length,
          itemBuilder: (context, index) {
            final ScholarshipModel scholarship = controller.scholarships[index];
            final deadline = scholarship.deadline != null
                ? DateFormat('dd MMM yyyy').format(DateTime.parse(scholarship.deadline!))
                : 'N/A';

            return GestureDetector(
              onTap: () {
                Get.toNamed('/scholarshipDetail', arguments: {'index': index});
              },
              child: TweenAnimationBuilder(
                tween: Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)), // Slide from right
                duration: Duration(milliseconds: 500 + (index * 100)), // Delayed effect
                curve: Curves.decelerate,
                builder: (context, Offset offset, child) {
                  return Transform.translate(
                    offset: offset * MediaQuery.of(context).size.width,
                    child: child,
                  );
                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scholarship.title ?? 'Unknown Scholarship',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.account_balance, color: Colors.grey[700], size: 20),
                            const SizedBox(width: 6),
                            Text(
                              scholarship.provider?.name ?? 'N/A',
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, color: Colors.redAccent, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              "Deadline: $deadline",
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
