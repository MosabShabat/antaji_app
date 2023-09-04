import 'dart:convert';
import 'dart:io';
import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:antaji_app/models/service_details.dart';
import 'package:antaji_app/models/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class registerAnAccountController extends GetxController with ApiHelper {
  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;

  var isDataServiceLoading = false.obs;
  var is_service_details_loading = false.obs;
  //is_service_details_loading
  RxBool isInit = true.obs;

  List<ServicesModel> services_model_Var = [];
  ServiceDetails? service_details_var;

  Future<void> getServices({bool refresh = false}) async {
    print(isDataServiceLoading.value);
    try {
      print('here error');
      isDataServiceLoading(true);
      print('here we go');
      services_model_Var.clear();
      if (refresh && currentPage == 1) {
        services_model_Var.clear();
      }
      print('here 0');
      Uri uri = Uri.parse(servicesServices);
      http.Response response = await http.get(
        uri,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${GetStorage().read('token')}",
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.acceptLanguageHeader: GetStorage().read('lang') == null
              ? 'en'
              : GetStorage().read('lang'),
        },
      );
      print('here 1');
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_prod_data = array['items'];

        totalDeals = responseData['pages']['total'];

        array_prod_data.forEach((element) {
          services_model_Var.add(ServicesModel.fromJson(element));
        });
        print('here 3');

        print('=========================');

        print(services_model_Var);
        print('=========================');

        if (currentPage < totalDeals && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // Future.delayed(Duration.zero, () {
      isDataServiceLoading(false);
      // });
    }
  }

  Future<void> getServicesDetails(uuid) async {
    try {
      is_service_details_loading(true);
      Uri uri = Uri.parse('${baseUrl}services/services/$uuid');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        service_details_var = ServiceDetails.fromJson(array);
        print('********************');
        print(service_details_var!.name);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      is_service_details_loading(false);
    }
  }
}
