import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/product_edit_screen.dart';

class LeasingScreen extends StatefulWidget {
  const LeasingScreen({super.key});

  @override
  State<LeasingScreen> createState() => _LeasingScreenState();
}

class _LeasingScreenState extends State<LeasingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            MyTextField(
                Radius: 24.0,
                hintText: SearchForProducts.tr,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: false,
                readOnly: false,
                prefixIcon: Icon(
                  Icons.search,
                  color: blackColor.value,
                )),
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
                        'معدات الصوت'
                            .text
                            .fontFamily(regular)
                            .size(14)
                            .color(blackColor.value)
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
                                SvgPicture.asset(
                                  editIcon,
                                  color: blackColor.value,
                                ),
                                10.widthBox,
                                EditText.tr.text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(
                                      blackColor.value,
                                    )
                                    .make(),
                              ],
                            )
                          ],
                        )
                            .box
                            .width(context.screenWidth / 2)
                            //  .color(greenColor)
                            .make()
                            .onTap(() {
                          Get.to(
                            () => ProductEditScreen(),
                            transition: Transition.rightToLeft,
                          );
                        }),
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
                  // Get.to(
                  //   () => OrderTrackingPurchaseScreen(),
                  //   transition: Transition.rightToLeft,
                  // );
                });
              },
            ),
            SizedBox(
              height: context.screenHeight / 2.4,
            )
          ],
        ),
      ),
    );
  }
}
