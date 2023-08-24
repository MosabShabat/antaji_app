import 'package:antaji_app/constant/const.dart';
export '../screens/main_and_sections_screens/audio_equipment_screen.dart';
export '../screens/main_and_sections_screens/browse_categories_screen.dart';
export '../screens/main_and_sections_screens/buying_and_selling.dart';
export '../screens/home_page_screen.dart';
export '../screens/main_and_sections_screens/popular_artists_screen.dart';
export '../screens/main_and_sections_screens/popular_products_for_rent_screen.dart';
export '../screens/main_and_sections_screens/pro_production_screen.dart';
export '../screens/main_and_sections_screens/rent_screen.dart';
export 'package:antaji_app/constant/const.dart';

class HomePageController extends GetxController {
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
}
