import 'package:antaji_app/features/home/screens/home_screen.dart';
import 'package:antaji_app/features/subscription_packages/screens/subscribed_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/const.dart';

class successfullyScreen extends StatefulWidget {
  const successfullyScreen({super.key});

  @override
  State<successfullyScreen> createState() => _successfullyScreenState();
}

class _successfullyScreenState extends State<successfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                DoneTicks,
              ),
              PaymentAndSubscriptionWereSuccessful.tr.text
                  .color(blackColor.value)
                  .fontFamily(bold)
                  .size(20)
                  .make(),
              10.heightBox,
              ProfessionalsPackage.tr.text
                  .color(greyColor)
                  .medium
                  .size(12)
                  .make(),
              20.heightBox,
              ListTile(
                title: orderNumber.tr.text
                    .color(blackColor.value)
                    .medium
                    .size(12)
                    .make(),
                trailing: '00'
                    .text
                    .color(blackColor.value)
                    .fontFamily(medium)
                    .size(14)
                    .make(),
              ),
              ListTile(
                title: theTime.tr.text
                    .color(blackColor.value)
                    .medium
                    .size(12)
                    .make(),
                trailing: '00'
                    .text
                    .color(blackColor.value)
                    .fontFamily(medium)
                    .size(14)
                    .make(),
              ),
              ListTile(
                title: SubscriptionDate.tr.text
                    .color(blackColor.value)
                    .medium
                    .size(12)
                    .make(),
                trailing: '00'
                    .text
                    .color(blackColor.value)
                    .fontFamily(medium)
                    .size(14)
                    .make(),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Continuation.tr.text
                      .color(whiteColor.value)
                      .fontFamily(bold)
                      .size(16)
                      .make(),
                ],
              )
                  .box
                  .height(context.screenHeight / 18)
                  .width(context.screenWidth)
                  .rounded
                  .color(blackColor.value)
                  .make()
                  .onTap(() {
                Get.to(
                  () => SubscribedSCreen(),
                  transition: Transition.rightToLeft,
                );
              }),
              20.heightBox,
              Main.tr.text.medium
                  .size(16)
                  .color(blackColor.value)
                  .make()
                  .onTap(() {
                Get.offAll(() => HomeScreen(initialTabIndex: 0),
                    transition: Transition.leftToRight);
              }),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
