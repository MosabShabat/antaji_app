import 'package:antaji_app/features/requests_user/screens/products%20_buy/order_tracking_purchase_screen.dart';

import '../../../../constant/const.dart';

class productsScreen extends StatefulWidget {
  const productsScreen({super.key});

  @override
  State<productsScreen> createState() => _productsScreenState();
}

class _productsScreenState extends State<productsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //  physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Today.tr.text
                .fontFamily(bold)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            ListView.builder(
              itemCount: 20,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: context.screenWidth / 2.5,
                          height: context.screenHeight / 22,
                          child:
                              'أساسيات التصوير السينمائي بالكاميرات الاحترافية'
                                  .text
                                  .maxLines(2)
                                  .fontFamily(bold)
                                  .size(12)
                                  .color(blackColor.value)
                                  .make(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'تأجير ، 6 أيام'
                                .text
                                .fontFamily(regular)
                                .size(14)
                                .color(blackColor.value)
                                .make(),
                          ],
                        )
                            .box
                            .width(context.screenWidth / 4.5)
                            .height(40)
                            .padding(EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ))
                            .withRounded(value: 24)
                            .color(lightColor.value)
                            .make(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            '280 ر.س'
                                .text
                                .fontFamily(bold)
                                .size(14)
                                .color(blackColor.value)
                                .make(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                'قيد الإنتظار'
                                    .text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(blueColor)
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
                                .color(blueColor.withOpacity(0.2))
                                .make(),
                          ],
                        )
                            .box
                            .width(context.screenWidth / 2)
                            //  .color(greenColor)
                            .make(),
                      ],
                    )
                  ],
                )
                    .box
                    .height(context.screenHeight / 6)
                    //.color(greenColor)
                    .margin(EdgeInsets.symmetric(vertical: 4))
                    .make()
                    .onTap(() {
                  Get.to(
                    () => OrderTrackingPurchaseScreen(),
                    transition: Transition.rightToLeft,
                  );
                });
              },
            ),
            SizedBox(
              height: context.screenHeight / 3.5,
            )
          ],
        ),
      ),
    );
  }
}
