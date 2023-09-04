import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/settings/screens/live_support_screen.dart';
import 'package:antaji_app/features/delivery_addresses/screens/edit_delivery_address_screen.dart';
import 'package:antaji_app/features/professionals/screens/portfolio_professional_screen.dart';
import 'package:antaji_app/features/requests_user/screens/types_of_orders/order_products_screen.dart';

class OrderTrackingPurchaseScreen extends StatefulWidget {
  const OrderTrackingPurchaseScreen({super.key});

  @override
  State<OrderTrackingPurchaseScreen> createState() =>
      _OrderTrackingPurchaseScreenState();
}

class _OrderTrackingPurchaseScreenState
    extends State<OrderTrackingPurchaseScreen> {
  int prog = 0;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderTracking.tr.text
                      .fontFamily(bold)
                      .size(24)
                      .color(blackColor.value)
                      .make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'قيد الإنتظار'
                          .text
                          .fontFamily(regular)
                          .size(14)
                          .color(Colors.orange)
                          .make(),
                    ],
                  )
                      .box
                      .width(context.screenWidth / 5)
                      .height(35)
                      .padding(EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ))
                      .withRounded(value: 12)
                      .color(Colors.orange.withOpacity(0.2))
                      .make(),
                ],
              ),
              10.heightBox,
              '12/06/2023 . 8:40 م'
                  .text
                  .fontFamily(regular)
                  .size(12)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buying.tr.text
                          .fontFamily(regular)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                      .box
                      .width(context.screenWidth / 5)
                      .height(35)
                      .padding(EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ))
                      .withRounded(value: 24)
                      .color(lightColor.value)
                      .make(),
                  Row(
                    children: [
                      '#3210'
                          .tr
                          .text
                          .fontFamily(regular)
                          .size(18)
                          .color(blackColor.value)
                          .make(),
                      10.widthBox,
                      SvgPicture.asset(
                        copyIcon,
                        color: blackColor.value,
                      ),
                    ],
                  ),
                ],
              ),
              20.heightBox,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          10.heightBox,
                          SvgPicture.asset(
                            orderTruckListImages[index],
                          ),
                          10.heightBox,
                          orderTruckListText[index]
                              .tr
                              .text
                              .fontFamily(regular)
                              .size(12)
                              .color(blackColor.value)
                              .make(),
                        ],
                      ).box.make(),
                      index == 0 || index == 1
                          ? VxDivider(
                              color: blackColor.value,
                              indent: context.screenWidth / 6.5,
                              endIndent: 0,
                              type: VxDividerType.horizontal,
                              width: 10,
                            )
                              .box
                              .height(2)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .color(lightColor.value)
                              .make()
                          : Container().box.make(),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 5)
                      .width(context.screenWidth / 2.7)
                      .make();
                },
              )
                  .box
                  .height(context.screenHeight / 9)
                  //.color(greenColor)
                  .padding(EdgeInsets.symmetric(horizontal: 8))
                  .width(context.screenWidth / 1.1)
                  .make(),
              20.heightBox,
              theProduct.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                children: [
                  Container(
                    width: context.screenWidth / 3,
                    height: context.screenHeight / 6.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(imageCamSta), fit: BoxFit.cover),
                    ),
                  ),
                  10.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.screenWidth / 2.5,
                        height: context.screenHeight / 24,
                        child: 'أساسيات التصوير السينمائي بالكاميرات الاحترافية'
                            .text
                            .maxLines(2)
                            .fontFamily(bold)
                            .size(12)
                            .color(blackColor.value)
                            .make(),
                      ),
                      'معدات الصوت , حزم الصوت'
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make()
                          .box
                          .make(),
                      '280 ر.س'
                          .text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value)
                          .make()
                          .box
                          .width(context.screenWidth / 2)
                          .make(),
                    ],
                  )
                ],
              )
                  .box
                  .height(context.screenHeight / 6)
                  .margin(EdgeInsets.symmetric(vertical: 4))
                  .make(),
              20.heightBox,
              vendor.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make()
                  .box
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: whiteColor.value,
                          radius: 30,
                          child: Image.asset(
                            UserImage,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          )),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          'كاتي سانت جون'
                              .text
                              .fontFamily(bold)
                              .color(blackColor.value)
                              .size(12)
                              .make(),
                          10.heightBox,
                          'تصوير سينمائي'
                              .text
                              .fontFamily(regular)
                              .color(blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      ),
                    ],
                  ).box.make().onTap(() {
                    Get.to(
                      () => PortfolioProfessionalScreen(),
                      transition: Transition.rightToLeft,
                    );
                  }),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: communication.tr.text
                          .fontFamily(medium)
                          .size(12)
                          .color(whiteColor.value)
                          .make(),
                    ),
                  )
                      .box
                      .width(context.screenWidth / 4)
                      .height(context.screenHeight / 20)
                      .color(blackColor.value)
                      .withRounded(value: 12)
                      .make(),
                ],
              ).box.width(context.screenWidth).make(),
              20.heightBox,
              DeliveryAddress.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: lightColor.value,
                    radius: context.screenWidth / 12,
                    child: SvgPicture.asset(
                      LightLocationIcon,
                      color: blackColor.value,
                    ),
                  ),
                  10.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'حي آل سيف جامع الجفارة'
                          .text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                      'السعودية ، الجفارة'
                          .text
                          .fontFamily(regular)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                ],
              ).box.make().onTap(() {
                Get.to(
                  () => EditDeliveryAddressScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
              20.heightBox,
              paymentMethod.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: SvgPicture.asset(
                    applePay,
                    color: blackColor.value,
                  ),
                ),
              )
                  .box
                  .width(context.screenWidth / 4)
                  .height(context.screenHeight / 16)
                  .color(whiteColor.value)
                  .withRounded(value: 12)
                  .make(),
              20.heightBox,
              Bill.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Container(
                height: context.screenHeight / 4,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  color: whiteColor.value,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      offset: Offset(0, 4.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: serviceText.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      trailing: '3000 ر.س'
                          .tr
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ),
                    Divider(
                      indent: 5,
                      endIndent: 5,
                      color: greyColor,
                    ),
                    ListTile(
                      leading: commission.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      trailing: '3000 ر.س'
                          .tr
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ),
                    Divider(
                      indent: 5,
                      endIndent: 5,
                      color: greyColor,
                    ),
                    ListTile(
                      leading: Total.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      trailing: '3000 ر.س'
                          .tr
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              technicalSupport.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              IfYouHaveAnyQuestions.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    outlineMessageIcon,
                    color: blackColor.value,
                  ),
                  10.widthBox,
                  LiveSupport.tr.text
                      .fontFamily(medium)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                ],
              )
                  .box
                  .height(context.screenHeight / 16)
                  .width(context.screenWidth)
                  .rounded
                  .color(lightColor.value)
                  .make()
                  .onTap(() {
                Get.to(
                  () => LiveSupportScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
              20.heightBox,
              Column(
                children: [
                  CancellingOrder.tr.text
                      .fontFamily(bold)
                      .size(20)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  YouCanCancelThe.tr.text
                      .fontFamily(regular)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CancellingOrder.tr.text
                          .fontFamily(medium)
                          .size(16)
                          .color(redColor)
                          .make(),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 16)
                      .width(context.screenWidth)
                      .color(redColor.withOpacity(0.2))
                      .rounded
                      .make()
                      .onTap(() {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: whiteColor.value,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CancellingOrder.tr.text
                                        .fontFamily(regular)
                                        .size(14)
                                        .align(TextAlign.start)
                                        .color(blackColor.value)
                                        .make(),
                                  ],
                                ),
                                20.heightBox,
                                DoYouWantToCancelTheOrder.tr.text
                                    .fontFamily(bold)
                                    .size(20)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                ThisStepCannotBeUndone.tr.text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                CustomButton(
                                  text: DoYouWantToCancelTheOrder.tr,
                                  textColor: whiteColor.value,
                                  backgroundColor: redColor,
                                  borderColor: redColor,
                                  onPressed: () {
                                    Get.off(
                                      () => orderProductsScreen(),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                )
                                    .box
                                    .height(100)
                                    .width(context.screenWidth - 40)
                                    .padding(EdgeInsets.all(20))
                                    .make(),
                                CustomButton(
                                  text: no.tr,
                                  textColor: blackColor.value,
                                  backgroundColor: lightColor.value,
                                  borderColor: lightColor.value,
                                  onPressed: () {
                                    Get.back();
                                  },
                                )
                                    .box
                                    .height(100)
                                    .width(context.screenWidth - 40)
                                    .padding(EdgeInsets.all(20))
                                    .make(),
                              ],
                            )
                                .box
                                .height(context.screenHeight / 2.5)
                                .width(context.screenWidth)
                                .color(whiteColor.value)
                                .make(),
                          );
                        });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
