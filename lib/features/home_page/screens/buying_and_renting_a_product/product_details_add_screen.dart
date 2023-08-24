import 'package:antaji_app/constant/const.dart';
import '../../../../common/widgets/cart_pay_ment.dart';
import '../../../../common/widgets/small_containers.dart';

class ProductDetailsAddScreen extends StatefulWidget {
  const ProductDetailsAddScreen({super.key});

  @override
  State<ProductDetailsAddScreen> createState() =>
      _ProductDetailsAddScreenState();
}

class _ProductDetailsAddScreenState extends State<ProductDetailsAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (BuildContext context) {
              return cartBottomSheet()
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 1.1)
                  .color(whiteColor.value)
                  .make();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: redColor, width: 2),
          ),
          primary: redColor,
          minimumSize: Size(context.screenWidth, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              vuesaxOutlineShoppingCart,
              color: blackColor.value,
            ),
            10.widthBox,
            AddToCart.tr.text
                .fontFamily(medium)
                .size(16)
                .color(whiteColor.value)
                .color(blackColor.value)
                .make(),
          ],
        ),
      )
          .box
          .height(80)
          .width(context.screenWidth - 40)
          .padding(EdgeInsets.all(12))
          .make(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    BGImage,
                    width: context.screenWidth,
                    height: context.screenHeight / 2.2,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: context.screenHeight / 2.2,
                      width: context.screenWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: context.screenHeight / 25,
                          horizontal: context.screenWidth / 38,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            10.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: whiteColor.value,
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: blackColor.value,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: whiteColor.value,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        IconsUpload,
                                        color: blackColor.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: whiteColor.value,
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: blackColor.value,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
                  .box
                  .height(context.screenHeight / 2.2)
                  .width(context.screenWidth)
                  .make(),
              smallContainers(
                widthSize: 70.0,
                heightSize: 70.0,
                image: BGImage,
              )
                  .box
                  .height(80)
                  .width(context.screenWidth)
                  .padding(EdgeInsets.only(
                    right: 16,
                  ))
                  .make(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    '16300 ر.س'
                        .text
                        .fontFamily(bold)
                        .size(18)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    'سوني ألفا a7S III كاميرا رقمية'
                        .text
                        .fontFamily(bold)
                        .size(18)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    ' حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III. حزمة كاميرا سوني A7S III.حزمة كاميرا سوني A7S III.'
                        .text
                        .fontFamily(medium)
                        .size(12)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    LocationOnTheMap.tr.text
                        .fontFamily(bold)
                        .size(14)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    Container()
                        .box
                        .rounded
                        .height(context.screenHeight / 5)
                        .color(greenColor)
                        .make(),
                    20.heightBox,
                    publisher.tr.text
                        .fontFamily(bold)
                        .size(12)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(UserImage),
                        ),
                        15.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'حسن مختار'
                                .text
                                .fontFamily(bold)
                                .color(blackColor.value)
                                .size(12)
                                .make(),
                            5.heightBox,
                            '34 منتج'
                                .text
                                .fontFamily(medium)
                                .color(blackColor.value)
                                .size(12)
                                .make(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
