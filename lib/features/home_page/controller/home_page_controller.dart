import 'dart:convert';
import 'dart:io';
import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/locations_model.dart';
import 'package:antaji_app/models/product_data.dart';
import 'package:antaji_app/models/product_details_model.dart';
import 'package:antaji_app/models/product_of_professionals_model.dart';
import 'package:antaji_app/models/services_model.dart';
import 'package:get_storage/get_storage.dart';
export '../screens/main_and_sections_screens/audio_equipment_screen.dart';
export '../screens/main_and_sections_screens/browse_categories_screen.dart';
export '../screens/home_page_screen.dart';
export '../screens/main_and_sections_screens/popular_artists_screen.dart';
export '../screens/main_and_sections_screens/popular_products_for_rent_screen.dart';
export '../screens/main_and_sections_screens/pro_production_screen.dart';
export '../screens/main_and_sections_screens/rent_screen.dart';
export 'package:antaji_app/constant/const.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController with ApiHelper {
  var value = 10.0.obs;

  RxBool isFromTheTopSelected = true.obs;
  RxBool isWhoLeastSelected = false.obs;
  RxBool isFromTheNewestSelected = true.obs;
  RxBool isAlphabeticalOrderSelected = false.obs;
  RxBool isFromAZSelected = true.obs;
  RxBool isFromZASelected = false.obs;
  RxBool isRented = true.obs;
  RxBool isVendor = false.obs;
  RxBool isTenant = true.obs;
  RxBool isBuyer = false.obs;
  //===========================================
  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;

  var isDataLoading = false.obs;
  var isDataSeeAllLoading = false.obs;
  var isDataTypeLoading = false.obs;
  var isDataCategoriesLoading = false.obs;
  var isDataCategoriesDetLoading = false.obs;
  var isDataProductDetailsModelLoading = false.obs;

  RxBool isInitHomePage = true.obs;

  String? image;
  String? title;
  String? name_translate;
  String? image_type;
  String? link_url;
  List<servicesModel> services_model_Var = [];
  List<ProductData> prod_data_var = [];
  List<ProductDetails> prod_det_var = [];
  List<ProminentArtists> prominent_artists_var = [];
  List<productOfProfessionals> product_of_professionals_var = [];
  List<ProductDetails> prod_det_type_var = [];
  List<ProductDataDet> prod_det_categories_var = [];
  List<ProductDetails> prod_det_categories_det_var = [];
  ProductDetailsModel? product_details_model_var;
  LocationsModel? Locations_model_var;

  //locationsItemsModel

  Future<void> getProdDetails({type, uuid}) async {
    try {
      isDataProductDetailsModelLoading(true);
      //  users_model_var!.video = '';
      Uri uri = Uri.parse('${baseUrl}$type/$uuid');

      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (type == 'products') {
        if (response.statusCode == 200) {
          var array = jsonDecode(response.body)['data'];
          product_details_model_var = ProductDetailsModel.fromJson(array);
          print('********************');
          print(product_details_model_var!.name);
          print(product_details_model_var!.specifications!.length);
          print('********************');
        }
      }
      if (type == 'locations') {
        if (response.statusCode == 200) {
          var array = jsonDecode(response.body)['data'];
          Locations_model_var = LocationsModel.fromJson(array);
          print('********************');
          print(uri);
          print(Locations_model_var!.name);
          print('********************');
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataProductDetailsModelLoading(false);
    }
  }

  //LocationsModel

  Future<void> getHome({bool refresh = false}) async {
    try {
      print('here is ');
      isDataLoading(true);
      print('here be ');
      services_model_Var.clear();
      prod_data_var.clear();
      // prod_data_det_var.clear();
      if (refresh && currentPage == 1) {
        services_model_Var.clear();
        prod_data_var.clear();
        // prod_data_det_var.clear();
      }
      print('here 11 ');
      Uri uri = Uri.parse(home_url);
      print('here 13 ');
      http.Response response = await http.get(
        uri,
        headers: headers(),

        // client: http.Client()..connectionState = ConnectionState.debug,
      );
      print('here 12 ');
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_prod_data = array['data'];

        var array_services_model = array['services'];

        print('here 1');
        image = array['home_page']['image'];
        title = array['home_page']['title'];
        name_translate = array['city']['name_translate'];

        print('here 2');
        totalDeals = responseData['pages']['total'];

        array_services_model.forEach((element) {
          services_model_Var.add(servicesModel.fromJson(element));
        });
        print('here 3');

        for (var index = 0; index < array_prod_data.length; index++) {
          var element = array_prod_data[index];
          // print(array_prod_data[index]['type']);
          if (array_prod_data[index]['type'] == 'object') {
            image_type = element['data']['image'];
            link_url = element['data']['link'];
            continue;
          }

          prod_data_var.add(ProductData.fromJson(element));
        }

        print('here 4');

        print('=========================');
        //  print(image_type);
        //  print(link_url);
        //  print(prod_data_var);
        // print(prod_data_det_var);
        print('=========================');

        if (currentPage < totalDeals && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isDataLoading(false);
      });
    }
  }

  Future<void> getSeeAll({bool refresh = false, String? url, int? type}) async {
    try {
      isDataSeeAllLoading(true);

      // prod_data_det_var.clear();
      prod_det_var.clear();
      prominent_artists_var.clear();
      product_of_professionals_var.clear();
      if (refresh && currentPage == 1) {
        // prod_data_det_var.clear();
        prod_det_var.clear();
        prominent_artists_var.clear();
        product_of_professionals_var.clear();
      }

      Uri uri = Uri.parse('${baseUrl}see_all?type=$url');
      print('5555555555555555555555');
      print(uri);
      print('5555555555555555555555');
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

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_prod_see_all_data = array['items'];
        totalDeals = responseData['pages']['total'];

        if (type == 1) {
          array_prod_see_all_data.forEach((element) {
            prod_det_var.add(ProductDetails.fromJson(element));
          });
        } else if (type == 2) {
          array_prod_see_all_data.forEach((element) {
            prominent_artists_var.add(ProminentArtists.fromJson(element));
          });
        } else if (type == 3) {
          array_prod_see_all_data.forEach((element) {
            product_of_professionals_var
                .add(productOfProfessionals.fromJson(element));
          });
        }

        print('here 4');

        print('=========================');
        // print(prod_data_det_var);
        print(prod_det_var);
        print(prominent_artists_var);
        print(product_of_professionals_var);
        print('=========================');

        if (currentPage < totalDeals && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      isDataSeeAllLoading(false);
      // });
    }
  }

  Future<void> getTypeData({
    bool refresh = false,
    String? url,
  }) async {
    try {
      isDataTypeLoading(true);
      prod_det_type_var.clear();
      if (refresh && currentPage == 1) {
        // prod_data_det_var.clear();
        prod_det_type_var.clear();
      }
      Uri uri = Uri.parse('${baseUrl}services/$url');
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
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_prod_see_all_data = array['items'];
        totalDeals = responseData['pages']['total'];

        array_prod_see_all_data.forEach((element) {
          prod_det_type_var.add(ProductDetails.fromJson(element));
        });
      }
      print('=========================');
      print(prod_det_type_var);
      print('=========================');

      if (currentPage < totalDeals && currentPage != currentPage) {
        currentPage++;
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      isDataTypeLoading(false);
      // });
    }
  }

  //locationsItemsModel

  Future<void> getCategoriesData({
    bool refresh = false,
    String? url,
  }) async {
    try {
      isDataCategoriesLoading(true);
      prod_det_categories_var.clear();
      if (refresh && currentPage == 1) {
        // prod_data_det_var.clear();
        prod_det_categories_var.clear();
      }
      Uri uri = Uri.parse('${baseUrl}categories$url');
      print(uri);
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
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_prod_see_all_data = array['items'];
        totalDeals = responseData['pages']['total'];

        array_prod_see_all_data.forEach((element) {
          prod_det_categories_var.add(ProductDataDet.fromJson(element));
        });
      }
      print('=========================');
      print(prod_det_categories_var);
      print('=========================');

      if (currentPage < totalDeals && currentPage != currentPage) {
        currentPage++;
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      isDataCategoriesLoading(false);
      // });
    }
  }

  Future<void> getCategoriesDetails({
    bool refresh = false,
    String? url,
  }) async {
    try {
      isDataCategoriesDetLoading(true);
      prod_det_categories_det_var.clear();
      if (refresh && currentPage == 1) {
        // prod_data_det_var.clear();
        prod_det_categories_det_var.clear();
      }
      Uri uri = Uri.parse('${baseUrl}categories$url');
      print(uri);
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
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var array = responseData['data'];
        var array_prod_see_all_data = array['items'];
        totalDeals = responseData['pages']['total'];

        array_prod_see_all_data.forEach((element) {
          prod_det_categories_det_var.add(ProductDetails.fromJson(element));
        });
      }
      print('=========================');
      print(prod_det_categories_var);
      print('=========================');

      if (currentPage < totalDeals && currentPage != currentPage) {
        currentPage++;
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      isDataCategoriesDetLoading(false);
      // });
    }
  }
}
//categories