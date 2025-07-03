import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart' as dio;
import 'package:jpss/models/myAppliedSchemesModel.dart';
import '../core/network/dio_client.dart';
import '../utils/helper.dart';

class MySchemesController extends GetxController{
  final _dio = DioClient().client;
  RxList<MyAppliedSchemesModel> mySchemes = <MyAppliedSchemesModel>[].obs;

  @override
  void onInit() {
    getMyAppliedSchemes();
    super.onInit();
  }

  /*
   * @desc Get applied scholarships of current user
   * @route /applications/me2
   */
  Future<void> getMyAppliedSchemes() async {
    try {
      final response = await _dio.get(
        "${dotenv.env['BACKEND_BASE_URL']}/applications/me",
        options: dio.Options(
          validateStatus: (status) => status != 401,
        ),);

      if (response.statusCode == 200) {
        final data = response.data;
        mySchemes.value = (data as List)
            .map((item) => MyAppliedSchemesModel.fromJson(item))
            .toList();

      } else {
        final errorMessage = response.data['message'] ?? 'Something went wrong';
        showSnackBar("Error", errorMessage);
      }
    } catch (e) {
      if (e is dio.DioException) {
        showSnackBar("Error", e.response?.data['message'] ?? "Cannot fetch applied schemes");
      } else {
        showSnackBar("Error", "Something went wrong");
      }
    }
  }
}