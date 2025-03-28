import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jpss/models/scholarshipModel.dart';
import 'package:jpss/utils/helper.dart';

class ScholarshipController extends GetxController {
  RxList<ScholarshipModel> scholarships = <ScholarshipModel>[].obs;

  @override
  void onInit() {
    fetchScholarships();
    super.onInit();
  }

  Future<void> fetchScholarships() async {
    final String baseUrl = dotenv.env['BACKEND_BASE_URL'] ?? '';
    final Uri url = Uri.parse('$baseUrl/scholarship');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Data is : ${jsonEncode(data)}");

        // Convert JSON to List of ScholarshipModel
        scholarships.value = (data['data'] as List)
            .map((item) => ScholarshipModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load scholarships');
      }
    } catch (e) {
      showSnackBar("Error", "Cannot fetch scholarships");
    }
  }
  @override
  void onClose() {
    scholarships.clear(); // Clear data if necessary
    super.onClose();
  }
}
