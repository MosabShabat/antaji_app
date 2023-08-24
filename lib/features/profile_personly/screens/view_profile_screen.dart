import 'package:antaji_app/features/profile_personly/screens/complete_my_profile_screen.dart';

import '../../../constant/const.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  BGImage,
                  width: context.screenWidth,
                  height: context.screenHeight / 3,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 20,
                  right: 12,
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: whiteColor.value,
                          radius: 60,
                          child: Image.asset(
                            UserImage,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          )),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          15.heightBox,
                          Row(
                            children: [
                              'كاتي سانت جون'
                                  .text
                                  .fontFamily(bold)
                                  .color(blackColor.value)
                                  .size(16)
                                  .make(),
                              10.widthBox,
                              SvgPicture.asset(verifyIcon),
                            ],
                          ),
                          10.heightBox,
                          'تصوير سينمائي'
                              .text
                              .fontFamily(medium)
                              .color(blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      ),
                      10.widthBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            editIcon,
                            color: whiteColor.value,
                          ),
                          10.widthBox,
                          EditText.tr.text
                              .fontFamily(medium)
                              .size(12)
                              .color(whiteColor.value)
                              .make(),
                        ],
                      )
                          .box
                          .width(context.screenWidth / 4)
                          .height(context.screenHeight / 20)
                          .color(blackColor.value)
                          .withRounded(value: 12)
                          .make()
                          .onTap(() {
                        Get.to(
                          () => CompleteMyProfileScreen(),
                          transition: Transition.rightToLeft,
                        );
                      }),
                    ],
                  )
                      .box
                      .width(context.screenWidth)
                      // .color(greenColor)
                      .make(),
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                            ],
                          ),
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
                //.color(greenColor)
                .make(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Brief.tr.text
                      .fontFamily(regular)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'تجارية إلى غير هادفة للربح ، سرد للوثيقة ، لقد صورت الكثير للعلامات التجارية التي تبيع بورش إلى شركة Teen Vogue  أود مساعدتك في التقاط رؤيتك.'
                          .text
                          .fontFamily(regular)
                          .size(14)
                          .lineHeight(2)
                          .color(blackColor.value)
                          .make()
                    ],
                  )
                      .box
                      .height(context.screenHeight / 6)
                      .width(context.screenWidth)
                      .rounded
                      .padding(EdgeInsets.all(20))
                      .color(lightColor.value)
                      .make(),
                  20.heightBox,
                  skillsText.tr.text
                      .fontFamily(regular)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: context.height / 18,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 4,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'مصور سينمائي'
                              .text
                              .fontFamily(regular)
                              .size(12)
                              .color(whiteColor.value)
                              .make()
                        ],
                      )
                          .box
                          .height(context.screenHeight / 18)
                          .width(context.screenWidth / 3)
                          .withRounded(
                            value: 24,
                          )
                          .padding(EdgeInsets.all(4))
                          .color(blackColor.value)
                          .make();
                    },
                  ),
                  20.heightBox,
                  IntroductoryVideo.tr.text
                      .fontFamily(regular)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Container()
                      .box
                      .height(context.screenHeight / 4)
                      .width(context.screenWidth)
                      .color(lightColor.value)
                      .rounded
                      .make(),
                  20.heightBox,
                  LocationOnTheMap.tr.text
                      .fontFamily(regular)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        LightLocationIcon,
                        color: blackColor.value,
                      ),
                      10.widthBox,
                      'الرياض ، شارع الملك عبدالله'
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 15)
                      .width(context.screenWidth)
                      .color(lightColor.value)
                      .padding(EdgeInsets.symmetric(
                        horizontal: 8,
                      ))
                      .rounded
                      .make()
                      .onTap(() {}),
                  20.heightBox,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
