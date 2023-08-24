import 'package:antaji_app/features/add_a_product_or_service/screens/add_successfully_screen.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../constant/const.dart';

class ProductPicturesScreen extends StatefulWidget {
  const ProductPicturesScreen({super.key});

  @override
  State<ProductPicturesScreen> createState() => _ProductPicturesScreenState();
}

class _ProductPicturesScreenState extends State<ProductPicturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
            ],
          )
              .box
              .margin(EdgeInsets.symmetric(horizontal: 15))
              .width(context.screenWidth / 5)
              .make()
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          toPublish.tr.text
              .fontFamily(bold)
              .color(whiteColor.value)
              .size(18)
              .make(),
        ],
      )
          .box
          .height(context.screenHeight / 16)
          .width(context.screenWidth)
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .color(blackColor.value)
          .rounded
          .make()
          .onTap(() {
        Get.to(
          () => addSuccessfullyScreen(),
          transition: Transition.rightToLeft,
        );
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductPictures.tr.text
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .size(24)
                  .make(),
              20.heightBox,
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height / 4.5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? DottedBorder(
                            color: greyColor,
                            radius: Radius.circular(10),
                            borderType: BorderType.RRect,
                            strokeWidth: 1.5,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    galleryAddIcon,
                                    color: blackColor.value,
                                  ),
                                  10.heightBox,
                                  AddPhotos.tr.text
                                      .fontFamily(regular)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                ],
                              ),
                            ),
                          ).box.rounded.make().onTap(() {
                            print('object 2');
                          })
                        : Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    //color: greenColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    image: DecorationImage(
                                      image: AssetImage(imageCamSta),
                                      fit: BoxFit.cover,
                                    )),
                              )
                                  .box
                                  .height(context.screenHeight / 3)
                                  .color(lightColor.value)
                                  .roundedSM
                                  .make()
                                  .onTap(() {
                                // Get.to(
                                //   () => FullScreenPicturesScreen(),
                                //   transition: Transition.rightToLeft,
                                // );
                              }),
                              Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: whiteColor.value,
                                  )
                                      .box
                                      .roundedFull
                                      .color(blackColor.value)
                                      .make()
                                      .onTap(() {}))
                            ],
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
