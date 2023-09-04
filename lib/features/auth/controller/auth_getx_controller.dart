import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/auth/controller/auth_api_controller.dart';
import 'package:antaji_app/models/response.dart' as Response;
import 'package:get_storage/get_storage.dart';
// import 'package:get_storage/get_storage.dart';

class AuthGetxController extends GetxController {
  Future<Response.Response> login({phone}) async {
    print('login');
    Response.Response response = await AuthApiController().loginNow(
      phone: phone,
    );
    return response;
  }

  Future<bool> reset({phone, code}) async {
    Response.Response response = await AuthApiController().resetPasswordNew(
      phone: phone,
      code: code,
    );
    var dataRes = response.data!;
    if (response.status!) {
      GetStorage().write("uuid", dataRes['uuid']);
      GetStorage().write("token", dataRes['token']);
      return response.status!;
    } else {
      return response.status!;
    }
  }

  Future<Response.Response> register({
    mobile,
    name,
    email,
    country_uuid,
    city_uuid,
    type,
  }) async {
    Response.Response response = await AuthApiController().registerNew(
      mobile: mobile,
      name: name,
      email: email,
      country_uuid: country_uuid,
      city_uuid: city_uuid,
      type: type,
    );
    return response;
  }

  Future<Response.Response> postViewsFunc({url}) async {
    Response.Response response = await AuthApiController().postViews(url: url);
    return response;
  }

  Future<Response.Response> logout() async {
    Response.Response response = await AuthApiController().logoutNow();
    return response;
  }

  Future<Response.Response> Add_prod({
    type,
    name,
    price,
    category_uuid,
    sub_category_uuid,
    lat,
    lng,
    details,
    address,
    keys,
    values,
    image,
  }) async {
    Response.Response response = await AuthApiController().addProduct(
      type: type,
      name: name,
      price: price,
      category_uuid: category_uuid,
      sub_category_uuid: sub_category_uuid,
      lat: lat,
      lng: lng,
      details: details,
      address: address,
      keys: keys,
      values: values,
      image: image,
    );
    return response;
  }

  

  Future<Response.Response> Add_Loc({
    name,
    price,
    category_contents_uuid,
    lat,
    lng,
    details,
    address,
    image,
  }) async {
    Response.Response response = await AuthApiController().addLocations(
      name: name,
      price: price,
      category_contents_uuid: category_contents_uuid,
      lat: lat,
      lng: lng,
      details: details,
      address: address,
      image: image,
    );
    return response;
  }

    Future<Response.Response> Edi_Loc({
      required url,
    name,
    price,
    category_contents_uuid,
    lat,
    lng,
    details,
    address,
    images,
  }) async {
    Response.Response response = await AuthApiController().EditLocation(
      url:url ,
      name: name,
      price: price,
      category_contents_uuid: category_contents_uuid,
      lat: lat,
      lng: lng,
      details: details,
      address: address,
      images: images,
    );
    return response;
  }


  Future<Response.Response> Edit_prod({
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
    keys,
    values,
    image,
  }) async {
    Response.Response response = await AuthApiController().EditProduct(
      url: url,
      type: type,
      name: name,
      price: price,
      category_uuid: category_uuid,
      sub_category_uuid: sub_category_uuid,
      lat: lat,
      lng: lng,
      details: details,
      address: address,
      keys: keys,
      values: values,
      image: image,
    );
    return response;
  }


  ///EditLocation
}
