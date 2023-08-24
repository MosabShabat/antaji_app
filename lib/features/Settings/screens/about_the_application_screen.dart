import 'package:antaji_app/local/my_local_controller.dart';

import '../../../constant/const.dart';

class AboutTheApplicationScreen extends StatefulWidget {
  const AboutTheApplicationScreen({super.key});

  @override
  State<AboutTheApplicationScreen> createState() =>
      _AboutTheApplicationScreenState();
}

class _AboutTheApplicationScreenState extends State<AboutTheApplicationScreen> {
  var ThemeController = MyLocalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutTheApplication.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              40.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ThemeController.isDarkMode.read('isDarkMode') == null
                            ? LightLogoIcon
                            : ThemeController.isDarkMode.read('isDarkMode') ==
                                    false
                                ? LightLogoIcon
                                : DarkLogoIcon,
                        width: context.screenWidth / 5,
                        height: context.screenHeight / 10,
                      ),
                      20.heightBox,
                      'إنتاجي'
                          .tr
                          .text
                          .fontFamily(bold)
                          .size(24)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                ],
              ),
              40.heightBox,
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.'
                  .tr
                  .text
                  .maxLines(5)
                  .size(12)
                  .fontFamily(bold)
                  .lineHeight(2)
                  .color(blackColor.value)
                  .make(),
              40.heightBox,
              SocialMedia.tr.text
                  .size(20)
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    radius: 22,
                    backgroundColor: lightColor.value,
                    child: SvgPicture.asset(
                      AboutTheApplicationImages[index],
                      color: blackColor.value,
                    ),
                  ).box.margin(EdgeInsets.symmetric(horizontal: 8)).make();
                },
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 12)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
