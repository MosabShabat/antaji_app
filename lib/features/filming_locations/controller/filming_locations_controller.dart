import 'dart:convert';

import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/locations_items_model.dart';
import 'package:antaji_app/models/product_data.dart';
import 'package:http/http.dart' as http;

class FilmingLocationsController extends GetxController with ApiHelper {
  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;

  var isDataLocationsItemsModelLoading = false.obs;
  var isDataLocationsItemsLoading = false.obs;

  locationsItemsModel? locations_items_model_var;

  List<ProductDetails> location_items_var = [];

  //ProductDetails

  Future<List<ProductDetails>> getLocationsItems({
    String? url,
  }) async {
    List<ProductDetails> l = [];
    Uri uri = Uri.parse('${baseUrl}services/locations?category_uuid=$url');
    http.Response response = await http.get(
      uri,
      headers: headers(),
    );
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var array = responseData['data'];
      var array_loca_items_data = array['items'];
      array_loca_items_data.forEach((e) => l.add(ProductDetails.fromJson(e)));
      print(l.length);
      return l;
    }
    print(l.length);
    return [];
  }

  Future<void> getLocationsCat({
    bool refresh = false,
  }) async {
    try {
      isDataLocationsItemsModelLoading(true);

      if (refresh && currentPage == 1) {}
      Uri uri = Uri.parse('${baseUrl}services/locations');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        totalDeals = responseData['pages']['total'];
//locations_items_model_var
        locations_items_model_var = locationsItemsModel.fromJson(array);
      }
      print('=========================');
      print(locations_items_model_var);
      print('=========================');

      if (currentPage < totalDeals && currentPage != currentPage) {
        currentPage++;
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      isDataLocationsItemsModelLoading(false);
      // });
    }
  }
}
