import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/home_page/screens/search/research_results_screen.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../artists/city_change_screen.dart';

class searchHistoryScreen extends StatefulWidget {
  const searchHistoryScreen({super.key});

  @override
  State<searchHistoryScreen> createState() => _searchHistoryScreenState();
}

class _searchHistoryScreenState extends State<searchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
              ),
              5.widthBox,
              'الرياض'.text.fontFamily(medium).size(12).black.make(),
              5.widthBox,
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          )
              .box
              .height(30)
              .width(context.screenWidth / 4)
              .color(lightColor.value)
              .margin(EdgeInsets.all(8))
              .withRounded(value: 24)
              .make()
              .onTap(() {
            Get.to(
              () => CityChangeScreen(),
              transition: Transition.rightToLeft,
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              research.tr.text.fontFamily(bold).size(24).black.make(),
              20.heightBox,
              MyTextField(
                prefixIcon: Icon(
                  Icons.search,
                  color: blackColor.value,
                ),
                Radius: 12.0,
                hintText: FindPhotography.tr,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: false,
                readOnly: false,
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  searchHistory.tr.text.fontFamily(bold).size(16).black.make(),
                  clearAll.tr.text
                      .fontFamily(medium)
                      .size(14)
                      .black
                      .make()
                      .onTap(() {
                    Get.back();
                  }),
                ],
              ),
              20.heightBox,
              ListTile(
                leading: SvgPicture.asset(
                  clockImage,
                  color: blackColor.value,
                ),
                title:
                    'كاميرا سوني'.text.fontFamily(medium).size(12).black.make(),
                trailing: Icon(
                  Icons.close,
                ),
              ).box.make().onTap(() {
                Get.to(
                  () => researchResultsScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
              20.heightBox,
              ListTile(
                leading: SvgPicture.asset(
                  clockImage,
                  color: blackColor.value,
                ),
                title:
                    'كاميرا سوني'.text.fontFamily(medium).size(12).black.make(),
                trailing: Icon(
                  Icons.close,
                ),
              ).box.make().onTap(() {
                Get.to(
                  () => researchResultsScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
