import 'package:antaji_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'constant/const.dart';
import 'features/home/controller/home_controller.dart';
import 'features/splash_screen/splash_screen.dart';
import 'local/local.dart';
import 'local/my_local_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    Get.put(HomeController());

    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: sansAloft,
        appBarTheme: AppBarTheme(
          color: whiteColor.value,
          elevation: 0,
          iconTheme: IconThemeData(
            color: blackColor.value,
          ),
        ),
      ),
      locale: controller.initialLang,
      translations: MyLocal(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
      ],
    );
  }
}
