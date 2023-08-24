import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/home_page/screens/search/research_results_screen.dart';
import 'package:antaji_app/features/home_page/screens/search/search_history_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../artists/city_change_screen.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
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
              'الرياض'
                  .text
                  .fontFamily(medium)
                  .size(12)
                  .color(blackColor.value)
                  .make(),
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
              research.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.search,
                    color: blackColor.value,
                  ),
                  10.widthBox,
                  FindPhotography.tr.text
                      .fontFamily(medium)
                      .size(12)
                      .color(blackColor.value)
                      .make(),
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(60)
                  .color(lightColor.value)
                  .rounded
                  .padding(EdgeInsets.symmetric(
                    horizontal: 12,
                  ))
                  .make()
                  .onTap(() {
                Get.to(
                  () => searchHistoryScreen(),
                  transition: Transition.downToUp,
                );
              }),
              20.heightBox,
              CustomButton(
                text: research.tr,
                textColor: whiteColor.value,
                backgroundColor: redColor,
                borderColor: redColor,
                onPressed: () {
                  Get.to(
                    () => researchResultsScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
              ).box.height(56).width(context.screenWidth - 40).make(),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(searchJson),
                  20.heightBox,
                  FindWhatYou.tr.text
                      .fontFamily(bold)
                      .size(24)
                      .color(blackColor.value)
                      .make(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
