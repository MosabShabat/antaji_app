import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height / 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Stack(
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
                            child: SvgPicture.asset(
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
                            }))
                      ],
                    );
                  }),
              SizedBox(
                height: context.screenHeight / 3.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
