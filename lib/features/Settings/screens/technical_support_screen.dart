import 'package:antaji_app/features/Settings/screens/connect_with_us_screen.dart';
import 'package:antaji_app/features/Settings/screens/live_support_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/const.dart';

class technicalSupportScreen extends StatefulWidget {
  const technicalSupportScreen({super.key});

  @override
  State<technicalSupportScreen> createState() => _technicalSupportScreenState();
}

class _technicalSupportScreenState extends State<technicalSupportScreen> {
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
              Lottie.asset(callUs),
              40.heightBox,
              technicalSupport.tr.text
                  .size(20)
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              IfYouHaveAnyQuestions.tr.text
                  .size(14)
                  .fontFamily(regular)
                  .color(blackColor.value)
                  .make(),
              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    outlineMessageIcon,
                    color: whiteColor.value,
                  ),
                  10.widthBox,
                  LiveSupport.tr.text
                      .size(16)
                      .fontFamily(regular)
                      .color(whiteColor.value)
                      .make(),
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 16)
                  .color(blackColor.value)
                  .rounded
                  .make()
                  .onTap(() {
                Get.to(
                  () => LiveSupportScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
              20.heightBox,
              ConnectWithUs.tr.text
                  .size(20)
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              IfUouHaveAProblem.tr.text
                  .size(14)
                  .fontFamily(regular)
                  .color(blackColor.value)
                  .make(),
              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SendingAMessage.tr.text
                      .size(16)
                      .fontFamily(regular)
                      .color(blackColor.value)
                      .make(),
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 16)
                  .color(lightColor.value)
                  .rounded
                  .make()
                  .onTap(() {
                Get.to(
                  () => ConnectWithUsScreen(),
                  transition: Transition.rightToLeft,
                );
                //ConnectWithUsScreen
              }),
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
