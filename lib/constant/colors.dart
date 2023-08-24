import '../local/my_local_controller.dart';
import 'const.dart';

var ThemeController = MyLocalController();

const mainColor = Color(0xFF430E18);
const yalowColor = Color(0xFFC09B67);
Rx<Color> whiteColor = ThemeController.isDarkMode.read('isDarkMode') == null
    ? Rx<Color>(Color(0xFFFFFFFF))
    : ThemeController.isDarkMode.read('isDarkMode') == false
        ? Rx<Color>(Color(0xFF12171D))
        : Rx<Color>(Color(0xFFFFFFFF));
Rx<Color> blackColor = ThemeController.isDarkMode.read('isDarkMode') == null
    ? Rx<Color>(Color(0xFF000000))
    : ThemeController.isDarkMode.read('isDarkMode') == false
        ? Rx<Color>(Color(0xFFFFFFFF))
        : Rx<Color>(Color(0xFF000000));
Rx<Color> lightColor = ThemeController.isDarkMode.read('isDarkMode') == null
    ? Rx<Color>(Color(0xFFF4F4F5))
    : ThemeController.isDarkMode.read('isDarkMode') == false
        ? Rx<Color>(Color(0xFF1A2027))
        : Rx<Color>(Color(0xFFF4F4F5));
const redColor = Color(0xFFE3071C);
const greyColor = Colors.grey;
const blueColor = Colors.blue;
const greenColor = Color(0xFF028C59);
const unSelectedTapBarColor = Color(0xFF4E4E4E);



//Colors.green,
//Color(0xFFFFFFFF);
//Color(0xFF000000);
//Color(0xFF12171D);
//4E4E4E
//Color(0xFF1A2027);
//Color(0xFFF4F4F5);
