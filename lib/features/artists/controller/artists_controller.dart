import 'dart:convert';
import 'dart:io';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/models/business_artists_model.dart';
import 'package:antaji_app/models/course_details_model.dart';
import 'package:antaji_app/models/courses_model.dart';
import 'package:antaji_app/models/users_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/product_data.dart';

class ArtistsController extends GetxController with ApiHelper {
  var isDataArtistsLoading = false.obs;
  var isDataUsersLoading = false.obs;
  var isDataBusinessArtistsLoading = false.obs;
   var isDataCourseDetailsLoading = false.obs;

  int currentPage = 1;
  int perPage = 10;
  int totalDeals = 0;

  List<ProminentArtists> prominent_all_artists_var = [];
  List<ImagesModel> images_artists_var = [];
  List<VideosModel> videos_artists_var = [];
  List<ProductDetails> sale_var = [];
  List<ProductDetails> rent_var = [];
  List<CoursesModel> courses_var = [];
  UsersModel? users_model_var;
  CourseDetailsModel? Course_details_model_var;
  //CourseDetailsModel

  var uuid_art;
  var name_translate_art;







    Future<void> getCourseDetails(uuid) async {
    try {
      isDataCourseDetailsLoading(true);
      Uri uri = Uri.parse('${baseUrl}courses/$uuid');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        Course_details_model_var = CourseDetailsModel.fromJson(array);
        print('********************');
        print(Course_details_model_var!.name);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataCourseDetailsLoading(false);
    }
  }

  Future<void> getAllArtists({bool refresh = false}) async {
    try {
      isDataArtistsLoading(true);

      prominent_all_artists_var.clear();
      if (refresh && currentPage == 1) {
        prominent_all_artists_var.clear();
      }

      Uri uri = Uri.parse(artists_url);

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
        uuid_art = array['city']['uuid'];
        name_translate_art = array['city']['name_translate'];
        totalDeals = responseData['pages']['total'];

        array_prod_see_all_data.forEach((element) {
          prominent_all_artists_var.add(ProminentArtists.fromJson(element));
        });

        print('here 4');

        print('=========================');
        print(prominent_all_artists_var);

        print('=========================');

        if (currentPage < totalDeals && currentPage != currentPage) {
          currentPage++;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      isDataArtistsLoading(false);
      // });
    }
  }

  Future<void> getUserDetails(uuid) async {
    try {
      isDataUsersLoading(true);
      //  users_model_var!.video = '';
      Uri uri = Uri.parse('${baseUrl}users/$uuid');
      http.Response response = await http.get(
        uri,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body)['data'];
        users_model_var = UsersModel.fromJson(array);
        print('********************');
        print(users_model_var!.name);
        print('********************');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataUsersLoading(false);
    }
  }

  Future<void> getBusinessArtists({
    bool refresh = false,
    int? type,
    String? url,
  }) async {
    try {
      isDataBusinessArtistsLoading(true);
      images_artists_var.clear();
      videos_artists_var.clear();
      if (type == 1) {
        if (refresh && currentPage == 1) {
          images_artists_var.clear();
        }
        Uri uri = Uri.parse('${baseUrl}users/$url');

        http.Response response = await http.get(
          uri,
          headers: headers(),
        );

        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          var array = responseData['data'];
          var array_images_data = array['items'];
          totalDeals = responseData['pages']['total'];

          array_images_data.forEach((element) {
            images_artists_var.add(ImagesModel.fromJson(element));
          });

          print('=========================');
          print(images_artists_var);
          print('=========================');

          if (currentPage < totalDeals && currentPage != currentPage) {
            currentPage++;
          }
        }
      }
      if (type == 2) {
        if (refresh && currentPage == 1) {
          videos_artists_var.clear();
        }
        Uri uri = Uri.parse('${baseUrl}users/$url');

        http.Response response = await http.get(
          uri,
          headers: headers(),
        );

        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          var array = responseData['data'];
          var array_videos_data = array['items'];
          totalDeals = responseData['pages']['total'];

          array_videos_data.forEach((element) {
            videos_artists_var.add(VideosModel.fromJson(element));
          });

          print('=========================');
          print(videos_artists_var);
          print('=========================');

          if (currentPage < totalDeals && currentPage != currentPage) {
            currentPage++;
          }
        }
      }
      if (type == 3) {
        if (refresh && currentPage == 1) {
          sale_var.clear();
        }
        Uri uri = Uri.parse('${baseUrl}users/$url');

        http.Response response = await http.get(
          uri,
          headers: headers(),
        );

        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          var array = responseData['data'];
          var array_sale_data = array['items'];
          totalDeals = responseData['pages']['total'];

          array_sale_data.forEach((element) {
            sale_var.add(ProductDetails.fromJson(element));
          });

          print('=========================');
          print(sale_var);
          print('=========================');

          if (currentPage < totalDeals && currentPage != currentPage) {
            currentPage++;
          }
        }
      }
      if (type == 4) {
        if (refresh && currentPage == 1) {
          rent_var.clear();
        }
        Uri uri = Uri.parse('${baseUrl}users/$url');

        http.Response response = await http.get(
          uri,
          headers: headers(),
        );

        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          var array = responseData['data'];
          var array_rent_data = array['items'];
          totalDeals = responseData['pages']['total'];

          array_rent_data.forEach((element) {
            rent_var.add(ProductDetails.fromJson(element));
          });

          print('=========================');
          print(rent_var);
          print('=========================');

          if (currentPage < totalDeals && currentPage != currentPage) {
            currentPage++;
          }
        }
      }
      if (type == 5) {
        if (refresh && currentPage == 1) {
          courses_var.clear();
        }
        Uri uri = Uri.parse('${baseUrl}users/$url');

        http.Response response = await http.get(
          uri,
          headers: headers(),
        );

        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          var array = responseData['data'];
          var array_courses_data = array['items'];
          totalDeals = responseData['pages']['total'];

          array_courses_data.forEach((element) {
            courses_var.add(CoursesModel.fromJson(element));
          });

          print('=========================');
          print(courses_var);
          print('=========================');

          if (currentPage < totalDeals && currentPage != currentPage) {
            currentPage++;
          }
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataBusinessArtistsLoading(false);
    }
  }
}
