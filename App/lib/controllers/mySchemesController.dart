import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../utils/helper.dart';

class MySchemesController extends GetxController{

  @override
  void onInit() {
    getMyAppliedSchemes();
    super.onInit();
  }

  Future<void> getMyAppliedSchemes() async{
    final String baseUrl = dotenv.env['BACKEND_BASE_URL'] ?? '';
    final Uri url = Uri.parse('$baseUrl/applications/me');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(response);

        // // Convert JSON to List of ScholarshipModel
        // scholarships.value = (data['data'] as List)
        //     .map((item) => ScholarshipModel.fromJson(item))
        //     .toList();
      } else {
        final errorMessage = jsonDecode(response.body)['message'] ?? 'Something went wrong';
        showSnackBar("Error", errorMessage);
      }
    } catch (e) {
      showSnackBar("Error", "Cannot fetch applied schemes");
    }
  }
}