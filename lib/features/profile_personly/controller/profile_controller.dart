import 'dart:convert';

import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController with ApiHelper {
  var isDataProfileLoading = false.obs;

  ProfileModel? profile_model_var;

  Future<void> getProfDetails(
    url,
  ) async {
    try {
      isDataProfileLoading(true);
      //  users_model_var!.video = '';
      Uri uri = Uri.parse('${baseUrl}$url');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );

      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        profile_model_var = ProfileModel.fromJson(array);
        print('********************');
        print(profile_model_var!.name);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataProfileLoading(false);
    }
  }
  //ProfileModel
}
