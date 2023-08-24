import 'package:antaji_app/features/subscription_packages/screens/package_purchase_screen.dart';

import '../../../constant/const.dart';

class SubscriptionPackagesScreen extends StatefulWidget {
  const SubscriptionPackagesScreen({super.key});

  @override
  State<SubscriptionPackagesScreen> createState() =>
      _SubscriptionPackagesScreenState();
}

class _SubscriptionPackagesScreenState
    extends State<SubscriptionPackagesScreen> {
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
              SubscriptionPackages.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              GetTheRightSubscriptionPackage.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Stack(
                children: [
                  SvgPicture.asset(
                    BGBlueIcon,
                    fit: BoxFit.cover,
                  )
                      .box
                      .width(context.screenWidth)
                      .height(context.screenHeight / 4)
                      //.color(greenColor)
                      .rounded
                      .make(),
                  Positioned(
                    top: 0,
                    child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Basic.tr.text
                                        .fontFamily(bold)
                                        .size(22)
                                        .color(blackColor.value)
                                        .make(),
                                    Complimentary.tr.text
                                        .fontFamily(bold)
                                        .size(22)
                                        .color(blackColor.value)
                                        .make(),
                                  ],
                                ),
                                20.heightBox,
                                '• ${UploadingProductsIn1080PQuality.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${UploadAMaximumOf3ProductsInEachCategory.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${Cut20PercentOfSales.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.done,
                                          color: blackColor.value,
                                        ),
                                        5.widthBox,
                                        Subscriber.tr.text
                                            .fontFamily(bold)
                                            .size(14)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 20)
                                        .width(context.screenWidth / 4)
                                        .rounded
                                        .color(Color(0xFFE2E6EA))
                                        .make(),
                                  ],
                                )
                              ],
                            ))
                        .box
                        .width(context.screenWidth / 1.1)
                        .height(context.screenHeight / 3.8)
                        .make(),
                  )
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 4)
                  //.color(greenColor)
                  .rounded
                  .make(),
              20.heightBox,
              Stack(
                children: [
                  SvgPicture.asset(
                    BGGreenIcon,
                    fit: BoxFit.cover,
                  )
                      .box
                      .width(context.screenWidth)
                      .height(context.screenHeight / 4)
                      //.color(greenColor)
                      .rounded
                      .make(),
                  Positioned(
                    top: 0,
                    child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Professionals.tr.text
                                        .fontFamily(bold)
                                        .size(22)
                                        .color(blackColor.value)
                                        .make(),
                                    '800 ${RS.tr}'
                                        .tr
                                        .text
                                        .fontFamily(bold)
                                        .size(22)
                                        .color(blackColor.value)
                                        .make(),
                                  ],
                                ),
                                20.heightBox,
                                '• ${UploadingProductsIn4KQuality.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${Upload50ProductsInEachCategory.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${Cut15PercentOfSales.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Subscription.tr.text
                                            .fontFamily(bold)
                                            .size(14)
                                            .color(whiteColor.value)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 20)
                                        .width(context.screenWidth / 4)
                                        .rounded
                                        .color(Color(0xFF10A580))
                                        .make()
                                        .onTap(() {
                                      Get.to(
                                        () => PackagePurchaseScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    }),
                                  ],
                                )
                              ],
                            ))
                        .box
                        .width(context.screenWidth / 1.1)
                        .height(context.screenHeight / 3.8)
                        .make(),
                  )
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 4)
                  //.color(greenColor)
                  .rounded
                  .make(),
              20.heightBox,
              Stack(
                children: [
                  SvgPicture.asset(
                    BGBlueAccentIcon,
                    fit: BoxFit.fill,
                  )
                      .box
                      .width(context.screenWidth)
                      .height(context.screenHeight / 2.3)
                      //.color(greenColor)
                      .withRounded(value: 30)
                      .make(),
                  Positioned(
                    top: 0,
                    child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VIP.tr.text
                                        .fontFamily(bold)
                                        .size(22)
                                        .color(blackColor.value)
                                        .make(),
                                    '1200 ${RS.tr}'
                                        .tr
                                        .text
                                        .fontFamily(bold)
                                        .size(22)
                                        .color(blackColor.value)
                                        .make(),
                                  ],
                                ),
                                20.heightBox,
                                '• ${UploadingProductsIn4KQuality.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${AddUnlimitedProducts.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${Cut15PercentOfSales.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${AccountVerification.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${CustomerService.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${CompleteAccountSetupIncludingDesignsAndProductUploads.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                '• ${AddFreeAdvertisementsWeekly.tr}'
                                    .tr
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Subscription.tr.text
                                            .fontFamily(bold)
                                            .size(14)
                                            .color(whiteColor.value)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 20)
                                        .width(context.screenWidth / 4)
                                        .rounded
                                        .color(Color(0xFF3A8BC4))
                                        .make()
                                        .onTap(() {
                                      Get.to(
                                        () => PackagePurchaseScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    }),
                                  ],
                                )
                              ],
                            ))
                        .box
                        .width(context.screenWidth / 1.1)
                        .height(context.screenHeight / 2.3)
                        .make(),
                  )
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 2.3)
                  //.color(greenColor)
                  .withRounded(value: 30)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
