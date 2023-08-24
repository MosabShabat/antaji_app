import 'package:lottie/lottie.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../home/screens/home_screen.dart';
import 'package:antaji_app/constant/const.dart';

class SubscribedScreen extends StatefulWidget {
  const SubscribedScreen({super.key});

  @override
  State<SubscribedScreen> createState() => _SubscribedScreenState();
}

class _SubscribedScreenState extends State<SubscribedScreen> {
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
              PaymentAndPurchase.tr.text
                  .color(blackColor.value)
                  .fontFamily(bold)
                  .size(20)
                  .make(),
              10.heightBox,
              YouCanView.tr.text.color(greyColor).medium.size(12).make(),
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
                title: TheDateOfPurchase.tr.text
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
              CustomButton(
                text: orderTracking.tr,
                textColor: whiteColor.value,
                backgroundColor: blackColor.value,
                borderColor: blackColor.value,
                onPressed: () {
                  // Get.to(
                  //   () => BuyAProductScreen(),
                  //   transition: Transition.rightToLeft,
                  // );
                },
              )
                  .box
                  .height(100)
                  .width(context.screenWidth)
                  .roundedLg
                  .padding(EdgeInsets.all(20))
                  .make(),
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
