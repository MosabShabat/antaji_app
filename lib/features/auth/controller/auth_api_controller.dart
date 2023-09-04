import 'dart:convert';
import 'dart:io';
import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/constant/const.dart';

import 'package:antaji_app/models/response.dart' as Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthApiController extends GetxController with ApiHelper {
  Future<Response.Response> loginNow({phone}) async {
    print(phone);
    Uri uri = Uri.parse(login);
    http.post(uri);
    var data = {
      'mobile': phone,
    };
    http.Response response = await http.post(uri, body: data);
    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> postViews({String? url}) async {
    Uri uri = Uri.parse(url!);
    http.post(uri);

    http.Response response = await http.post(uri);
    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> resetPasswordNew({
    required String phone,
    required String code,
  }) async {
    Uri uri = Uri.parse(verifyCode);
    var response = await http.post(uri, body: {
      'mobile': phone,
      'code': code,
      'fcm_token': 'fcm_token',
      'fcm_device': Platform.isAndroid ? 'android' : 'ios',
    });

    return Response.Response.fromJson(jsonDecode(response.body));
  }

  Future<Response.Response> registerNew({
    mobile,
    name,
    email,
    country_uuid,
    city_uuid,
    type,
  }) async {
    Uri uri = Uri.parse(register_url);
    http.post(uri);
    var data = {
      'mobile': mobile,
      'name': name,
      'email': email,
      'country_uuid': country_uuid,
      'city_uuid': city_uuid,
      'type': type,
    };

    http.Response response = await http.post(
      uri,
      body: data,
      headers: headers(),
    );
    print(uri);
    print('response.statusCode =  ${response.statusCode}');

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      String token = responseData['data']['token'];
      String uuid = responseData['data']['uuid'];
      GetStorage().write('token', token);
      GetStorage().write('uuid', uuid);
      return Response.Response.fromJson(responseData);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> logoutNow() async {
    Uri uri = Uri.parse(logout_url);
    var response = await http.get(uri, headers: headers());
    if (response.statusCode == 200 || response.statusCode == 401) {
      await GetStorage().erase();
      var jsonResponse = jsonDecode(response.body);
      return Response.Response(
          message: response.statusCode == 200
              ? jsonResponse['message']
              : Get.snackbar('message', 'Logged out successfully'),
          status: true,
          data: []);
    }
    return failedResponse;
  }

  Future<Response.Response> addProduct({
    type,
    name,
    price,
    category_uuid,
    sub_category_uuid,
    lat,
    lng,
    details,
    address,
    List<String>? keys,
    List<String>? values,
    List<File>? image,
  }) async {
    Uri uri = Uri.parse(add_products_url);
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['type'] = type;
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['category_uuid'] = category_uuid;
    request.fields['sub_category_uuid'] = sub_category_uuid;
    request.fields['lat'] = lat;
    request.fields['lng'] = lng;
    request.fields['details'] = details;
    request.fields['address'] = address;
    for (int i = 0; i < keys!.length; i++) {
      request.fields['keys[$i]'] = keys[i];
    }
    for (int i = 0; i < values!.length; i++) {
      request.fields['values[$i]'] = values[i];
    }

    if (image != null) {
      for (int i = 0; i < image.length; i++) {
        String imagePath = image[i].path;
        request.files
            .add(await http.MultipartFile.fromPath("images[$i]", imagePath));
      }
    }
    // request.files.add(await http.MultipartFile.fromPath("image", image!));

    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${GetStorage().read('token')}";
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.acceptLanguageHeader] =
        GetStorage().read('lang') == null ? 'en' : GetStorage().read('lang');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = await response.stream.transform(utf8.decoder).join();

      var jsonResponse = jsonDecode(body);

      return Response.Response.fromJson(jsonResponse);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> addLocations({
    name,
    price,
    List<String>? category_contents_uuid,
    lat,
    lng,
    details,
    address,
    List<File>? image,
  }) async {
    Uri uri = Uri.parse(add_loc_url);
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['lat'] = lat;
    request.fields['lng'] = lng;
    request.fields['details'] = details;
    request.fields['address'] = address;
    for (int i = 0; i < category_contents_uuid!.length; i++) {
      request.fields['category_contents_uuid[$i]'] = category_contents_uuid[i];
    }

    if (image != null) {
      for (int i = 0; i < image.length; i++) {
        String imagePath = image[i].path;
        request.files
            .add(await http.MultipartFile.fromPath("images[$i]", imagePath));
      }
    }
    // request.files.add(await http.MultipartFile.fromPath("image", image!));

    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${GetStorage().read('token')}";
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.acceptLanguageHeader] =
        GetStorage().read('lang') == null ? 'en' : GetStorage().read('lang');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = await response.stream.transform(utf8.decoder).join();

      var jsonResponse = jsonDecode(body);

      return Response.Response.fromJson(jsonResponse);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> EditLocation({
    required url,
    name,
    price,
    lat,
    lng,
    details,
    address,
    List<String>? category_contents_uuid,
    List<File>? images,
  }) async {
    Uri uri = Uri.parse('${edit_location_url}$url/update');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['price'] = price;

    request.fields['lat'] = lat;
    request.fields['lng'] = lng;
    request.fields['details'] = details;
    request.fields['address'] = address;
    for (int i = 0; i < category_contents_uuid!.length; i++) {
      request.fields['category_contents_uuid[$i]'] = category_contents_uuid[i];
    }

    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        String imagePath = images[i].path;
        request.files
            .add(await http.MultipartFile.fromPath("images[$i]", imagePath));
      }
    }
    // request.files.add(await http.MultipartFile.fromPath("image", image!));

    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${GetStorage().read('token')}";
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.acceptLanguageHeader] =
        GetStorage().read('lang') == null ? 'en' : GetStorage().read('lang');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = await response.stream.transform(utf8.decoder).join();

      var jsonResponse = jsonDecode(body);

      return Response.Response.fromJson(jsonResponse);
    } else {
      return failedResponse;
    }
  }

  Future<Response.Response> EditProduct({
    required url,
    type,
    name,
    price,
    category_uuid,
    sub_category_uuid,
    lat,
    lng,
    details,
    address,
    List<String>? keys,
    List<String>? values,
    List<File>? image,
  }) async {
    Uri uri = Uri.parse('${edit_products_url}$url/update');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['type'] = type;
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['category_uuid'] = category_uuid;
    request.fields['sub_category_uuid'] = sub_category_uuid;
    request.fields['lat'] = lat;
    request.fields['lng'] = lng;
    request.fields['details'] = details;
    request.fields['address'] = address;
    for (int i = 0; i < keys!.length; i++) {
      request.fields['keys[$i]'] = keys[i];
    }
    for (int i = 0; i < values!.length; i++) {
      request.fields['values[$i]'] = values[i];
    }

    if (image != null) {
      for (int i = 0; i < image.length; i++) {
        String imagePath = image[i].path;
        request.files
            .add(await http.MultipartFile.fromPath("images[$i]", imagePath));
      }
    }
    // request.files.add(await http.MultipartFile.fromPath("image", image!));

    request.headers[HttpHeaders.authorizationHeader] =
        "Bearer ${GetStorage().read('token')}";
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.acceptLanguageHeader] =
        GetStorage().read('lang') == null ? 'en' : GetStorage().read('lang');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = await response.stream.transform(utf8.decoder).join();

      var jsonResponse = jsonDecode(body);

      return Response.Response.fromJson(jsonResponse);
    } else {
      return failedResponse;
    }
  }
}
