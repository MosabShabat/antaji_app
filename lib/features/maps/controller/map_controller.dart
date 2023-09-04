import 'dart:convert';

import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:antaji_app/models/map_model.dart';
import 'package:antaji_app/models/map_prod_item_model.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController with ApiHelper {
  var isDataMapLoading = false.obs;
  // var isDataLocationsMapItemsLoading = false.obs;

  MapModel? map_model_var;

  //  List<MapProdItem> map_prod_item_model_var = [];

  //  Future<void> getSubCutData({
  // required String? url,
  // }) async {
  //   try {
  //     isDataLocationsMapItemsLoading(true);
  //     map_prod_item_model_var.clear();

  //     Uri uri = Uri.parse('${baseUrl}map?category_uuid=$url');
  //     http.Response response = await http.get(
  //       uri,
  //       headers: headers(),
  //     );
  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body);
  //       var array = responseData['data'];
  //       var array_sub_cat_model_data = array['items'];

  //       array_sub_cat_model_data.forEach((element) {
  //         map_prod_item_model_var.add(MapProdItem.fromJson(element));
  //       });
  //     }
  //     print('=========================');
  //     print(map_prod_item_model_var);
  //     print('=========================');

  //   } catch (e) {
  //     print('Error while getting data is $e');
  //   } finally {
  //     isDataLocationsMapItemsLoading(false);

  //   }
  // }

  Future<List<MapProdItem>> getLocationsMapItems({
    String? url,
  }) async {
    List<MapProdItem> l = [];
    Uri uri = Uri.parse('${baseUrl}map?category_uuid=$url');
    http.Response response = await http.get(
      uri,
      headers: headers(),
    );
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var array = responseData['data'];
      var array_map_items_data = array['items'];
      array_map_items_data.forEach((e) => l.add(MapProdItem.fromJson(e)));
      print(l.length);
      return l;
    }
    print(l.length);
    return [];
  }
  //MapProdItem

  Future<void> getMaps() async {
    try {
      isDataMapLoading(true);
      Uri uri = Uri.parse(map_url);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        map_model_var = MapModel.fromJson(array);
        print('********************');
        print(map_model_var!.categories!.length);
        print(map_model_var!.items!.length);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataMapLoading(false);
    }
  }
  //MapModel
}
