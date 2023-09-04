import 'dart:convert';

import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/my_courses_model.dart';
import 'package:http/http.dart' as http;

class ConVerController extends GetxController with ApiHelper {
  var isDataCorsesLoading = false.obs;

  List<MyCoursesModel> my_courses_model_Var = [];

  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;

  Future<void> getMyCourses({
    bool refresh = false,
  }) async {
    try {
      isDataCorsesLoading(true);
      my_courses_model_Var.clear();
      if (refresh && currentPage == 1) {
        my_courses_model_Var.clear();
      }
      Uri uri = Uri.parse(my_courses_url);

      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_my_courses_data = array['items'];
         totalDeals = responseData['pages']['total'];

           array_my_courses_data.forEach((element) {
            my_courses_model_Var.add(MyCoursesModel.fromJson(element));
          });

           if (currentPage < totalDeals && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataCorsesLoading(false);
    }
  }

//MyCoursesModel
}
