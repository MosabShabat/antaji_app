import 'package:antaji_app/features/home/screens/home_screen.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constant/const.dart';
import '../../../local/my_local_controller.dart';

class languageScreen extends StatefulWidget {
  const languageScreen({super.key});

  @override
  State<languageScreen> createState() => _languageScreenState();
}

class _languageScreenState extends State<languageScreen> {
  final _localController = Get.put(MyLocalController());
  final GetStorage _storage = GetStorage();
  int selectedLanguage = 0;

  @override
  void initState() {
    super.initState();
    String? storedLanguage = _storage.read('lang');
    if (storedLanguage != null) {
      // Check if the stored language matches Arabic or English
      if (storedLanguage == 'ar') {
        selectedLanguage = 0;
      } else if (storedLanguage == 'en') {
        selectedLanguage = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.screenHeight / 10,
            ),
            theLanguage.tr.text
                .fontFamily(bold)
                .color(blackColor.value)
                .size(24)
                .make(),
            20.heightBox,
            CheckboxListTile(
              activeColor: blackColor.value,
              checkboxShape: CircleBorder(),
              value: selectedLanguage == 0,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = 0;
                });
              },
              secondary: SvgPicture.asset(ArabicFlagIcon),
              title: Arabic.tr.text
                  .fontFamily(regular)
                  .color(blackColor.value)
                  .size(16)
                  .make(),
            ),
            20.heightBox,
            CheckboxListTile(
              activeColor: blackColor.value,
              checkboxShape: CircleBorder(),
              value: selectedLanguage == 1,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = 1;
                });
              },
              secondary: SvgPicture.asset(EnglishFlagIcon),
              title: English.tr.text
                  .fontFamily(regular)
                  .color(blackColor.value)
                  .size(16)
                  .make(),
            ),
            SizedBox(
              height: context.screenHeight / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                saveText.tr.text
                    .fontFamily(bold)
                    .size(18)
                    .color(whiteColor.value)
                    .make()
              ],
            )
                .box
                .height(context.screenHeight / 16)
                .width(context.screenWidth)
                .rounded
                .color(blackColor.value)
                .make()
                .onTap(() {
              if (selectedLanguage == 0) {
                _localController.changeLang('ar');
              } else if (selectedLanguage == 1) {
                _localController.changeLang('en');
              }
              Get.off(
                () => HomeScreen(initialTabIndex: 0),
                transition: Transition.rightToLeft,
              );
            })
          ],
        ),
      ),
    );
  }
}
