import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';

class PortfolioVideoScreen extends StatefulWidget {
  const PortfolioVideoScreen({super.key});

  @override
  State<PortfolioVideoScreen> createState() => _PortfolioVideoScreenState();
}

class _PortfolioVideoScreenState extends State<PortfolioVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: context.screenWidth / 2.5,
                      height: context.screenHeight / 7,
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
                        'خائف | فيلم قصير'
                            .text
                            .fontFamily(bold)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        '3:30'
                            .text
                            .fontFamily(regular)
                            .size(12)
                            .color(blackColor.value)
                            .make(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            '1.8 ألف مشاهدة'
                                .text
                                .fontFamily(regular)
                                .size(12)
                                .color(blackColor.value)
                                .make(),
                            SvgPicture.asset(
                              CloseButtonedIcon,
                            ).onTap(() {
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          20.heightBox,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              deleteWork.tr.text
                                                  .fontFamily(regular)
                                                  .size(14)
                                                  .align(TextAlign.start)
                                                  .color(blackColor.value)
                                                  .make(),
                                            ],
                                          ),
                                          20.heightBox,
                                          DoYouWantToDeleteThisWork.tr.text
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
                                            text: YesDelete.tr,
                                            textColor: whiteColor.value,
                                            backgroundColor: redColor,
                                            borderColor: redColor,
                                            onPressed: () {
                                              // Get.off(
                                              //   () => orderProductsScreen(),
                                              //   transition: Transition.rightToLeft,
                                              // );
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
                            })
                          ],
                        ).box.width(context.screenWidth / 2.3).make(),
                      ],
                    )
                  ],
                )
                    .box
                    .height(context.screenHeight / 6)
                    //.color(greenColor)
                    .margin(EdgeInsets.symmetric(vertical: 12))
                    .make();
              },
            ),
            SizedBox(
              height: context.screenHeight / 3.5,
            )
          ],
        ),
      )),
    );
  }
}
