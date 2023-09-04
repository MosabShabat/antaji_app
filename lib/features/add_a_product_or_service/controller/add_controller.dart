import 'dart:convert';
import 'package:antaji_app/models/add_location_model.dart';
import 'package:antaji_app/models/edit_location_model.dart';
import 'package:antaji_app/models/response.dart' as Response;
import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:antaji_app/models/add_product_model.dart';
import 'package:antaji_app/models/cat_model.dart';
import 'package:antaji_app/models/edite_product_model.dart';
import 'package:http/http.dart' as http;

class AddController extends GetxController with ApiHelper {
  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;

  var isDataAddLoading = false.obs;
  var isDataCatLoading = false.obs;
  var isDataCatLocationLoading = false.obs;
  var isDataSubCatLoading = false.obs;
  var isDataEditProductLoading = false.obs;
  var isDataEditLocationLoading = false.obs;

  // List<AddProductModel> add_product_model_Var = [];
  List<CatModel> cat_model_Var = [];
  // List<CatModel> cat_location_model_Var = [];
  List<CatModel> sub_cat_model_Var = [];
  EditProductModel? edit_product_model_var;
  EditLocationModel? edit_location_model_var;
  //EditLocationModel

  Future<void> getEditLocation(uuid) async {
    try {
      isDataEditLocationLoading(true);
      //  users_model_var!.video = '';
      Uri uri = Uri.parse('${baseUrl}contents/locations/$uuid/edit');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        edit_location_model_var = EditLocationModel.fromJson(array);
        print('********************');
        print(edit_location_model_var!.item!.name!);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataEditLocationLoading(false);
    }
  }

  Future<void> getEditProduct(uuid) async {
    try {
      isDataEditProductLoading(true);
      //  users_model_var!.video = '';
      Uri uri = Uri.parse('${baseUrl}contents/products/$uuid/edit');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        edit_product_model_var = EditProductModel.fromJson(array);
        print('********************');
        print(edit_product_model_var!.item!.name!);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataEditProductLoading(false);
    }
  }

  Future<void> getCutData() async {
    try {
      isDataCatLoading(true);
      cat_model_Var.clear();

      Uri uri = Uri.parse(cat_url);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_cat_model_data = array['items'];

        array_cat_model_data.forEach((element) {
          cat_model_Var.add(CatModel.fromJson(element));
        });
      }
      print('=========================');
      print(cat_model_Var);
      print('=========================');
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataCatLoading(false);
    }
  }

  Future<void> getSubCutData({
    required String? url,
  }) async {
    try {
      isDataSubCatLoading(true);
      sub_cat_model_Var.clear();

      Uri uri = Uri.parse('${baseUrl}contents/products/categories/$url?name');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_sub_cat_model_data = array['items'];

        array_sub_cat_model_data.forEach((element) {
          sub_cat_model_Var.add(CatModel.fromJson(element));
        });
      }
      print('=========================');
      print(sub_cat_model_Var);
      print('=========================');
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataSubCatLoading(false);
    }
  }

  Future<List<AddProductModel>> getAddProdData({
    bool refresh = false,
    String? url,
  }) async {
    try {
      // isDataAddLoading(true);
      // add_product_model_Var.clear();
      List<AddProductModel> add_product_model_Var = [];
      if (refresh && currentPage == 1) {
        // prod_data_det_var.clear();
        add_product_model_Var.clear();
      }
      Uri uri = Uri.parse('${add_prod_url}/$url');
      print(uri);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_add_product_model_data = array['items'];
        totalDeals = responseData['pages']['total'];

        array_add_product_model_data.forEach((element) {
          add_product_model_Var.add(AddProductModel.fromJson(element));
        });
        return add_product_model_Var;
      }
      print('=========================');
      print(add_product_model_Var);
      print('=========================');

      if (currentPage < totalDeals && currentPage != currentPage) {
        currentPage++;
      }
      return [];
    } catch (e) {
      print('Error while getting data is $e');
      return [];
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //  isDataAddLoading(false);
      // });
    }
  }

  Future<Response.Response> deleteProduct({uuid}) async {
    Uri uri = Uri.parse('${delete_products_url}$uuid');
    var response = await http.delete(uri, headers: headers());
    if (response.statusCode == 200) {
      return Response.Response.fromJson(jsonDecode(response.body));
    }
    return failedResponse;
  }

  Future<Response.Response> deleteLocation({uuid}) async {
    Uri uri = Uri.parse('${delete_locations_url}$uuid');
    var response = await http.delete(uri, headers: headers());
    if (response.statusCode == 200) {
      return Response.Response.fromJson(jsonDecode(response.body));
    }
    return failedResponse;
  }

  //AddLocationModel

  Future<List<AddLocationModel>> getAddLocationData({
    bool refresh = false,
    required String? url,
  }) async {
    try {
      // isDataAddLoading(true);
      // add_product_model_Var.clear();
      List<AddLocationModel> add_location_model_Var = [];
      if (refresh && currentPage == 1) {
        // prod_data_det_var.clear();
        add_location_model_Var.clear();
      }
      Uri uri = Uri.parse('${add_locations_url}$url');
      print(uri);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_add_product_model_data = array['items'];
        totalDeals = responseData['pages']['total'];

        array_add_product_model_data.forEach((element) {
          add_location_model_Var.add(AddLocationModel.fromJson(element));
        });
        return add_location_model_Var;
      }
      print('=========================');
      print(add_location_model_Var);
      print('=========================');

      if (currentPage < totalDeals && currentPage != currentPage) {
        currentPage++;
      }
      return [];
    } catch (e) {
      print('Error while getting data is $e');
      return [];
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //  isDataAddLoading(false);
      // });
    }
  }

  Future<List<CatModel>> getCutLocationData({url}) async {
    try {
      // isDataCatLocationLoading(true);
      List<CatModel> cat_location_model_Var = [];

      // cat_location_model_Var.clear();

      Uri uri = Uri.parse('${cat_location_url}$url');
      print(uri);
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_cat_model_data = array['items'];

        array_cat_model_data.forEach((element) {
          cat_location_model_Var.add(CatModel.fromJson(element));
        });
        return cat_location_model_Var;
      }
      print('=========================');
      print(cat_location_model_Var);
      print('=========================');
      return [];
    } catch (e) {
      print('Error while getting data is $e');
      return [];
    } finally {
      // isDataCatLocationLoading(false);
    }
  }
}
