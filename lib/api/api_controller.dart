import 'dart:convert';
import 'package:antaji_app/api/api_helper.dart';
import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/intros.dart';
import 'package:http/http.dart' as http;
import 'package:antaji_app/models/countries.dart' as Countries;

class ApiController extends ApiHelper {
  List<Intros> intros_var = [];
  var isDataLoading = false.obs;

  var isCountries = false.obs;

  List<Countries.Countries> Countries_Var = [];
  List<Countries.Cities> Cities_Var = [];

  getCountries({bool refresh = false}) async {
    try {
      isCountries.value = true;
      if (refresh) {
        Countries_Var.clear();
        Cities_Var.clear();
      }
      Uri URI = Uri.parse(countries_url);
      http.Response response = await http.get(
        URI,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var array = jsonDecode(response.body);

        var arrayCountries = array['data']['countries'] as List<dynamic>;

        var arrayCities = array['data']['countries'] as List<dynamic>;

        for (var element in arrayCountries) {
          Countries_Var.add(Countries.Countries.fromJson(element));
        }

        for (var element in arrayCities) {
          Cities_Var.add(Countries.Cities.fromJson(element));
        }
      }
    } catch (e) {
      print('Error while getting data: $e');
    } finally {
      isCountries.value = false;
    }
  }

  getInit() async {
    try {
      isDataLoading(true);
      intros_var.clear();
      Uri URI = Uri.parse(intro);
      http.Response response = await http.get(
        URI,
        headers: headers(),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var arrayIntro = responseData['data']['intros'];
        arrayIntro.forEach((element) {
          intros_var.add(Intros.fromJson(element));
        });
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
