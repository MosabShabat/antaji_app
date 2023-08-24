import 'package:antaji_app/features/artists/portfolio/brief_screen.dart';
import 'package:antaji_app/features/artists/portfolio/courses_screen.dart';
import 'package:antaji_app/features/artists/portfolio/products_screen.dart';

import '../../../constant/const.dart';

class PortfolioProfessionalScreen extends StatefulWidget {
  const PortfolioProfessionalScreen({super.key});

  @override
  State<PortfolioProfessionalScreen> createState() =>
      _PortfolioProfessionalScreenState();
}

class _PortfolioProfessionalScreenState
    extends State<PortfolioProfessionalScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    super.initState();
  }

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
                        userText.tr.text
                            .fontFamily(medium)
                            .color(blackColor.value)
                            .size(12)
                            .make(),
                      ],
                    ),
                    10.widthBox,
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
              //.color(greenColor)
              .make(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        'مصور سينمائي'
                            .tr
                            .text
                            .fontFamily(medium)
                            .size(12)
                            .color(blackColor.value)
                            .make(),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 20)
                        .width(context.screenWidth / 4)
                        .color(lightColor.value)
                        .withRounded(value: 24)
                        .padding(EdgeInsets.all(8))
                        .margin(EdgeInsets.only(left: 8))
                        .make();
                  },
                )
                    .box
                    .height(context.screenHeight / 20)
                    // .width(context.screenWidth)
                    .make(),
                20.heightBox,
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ListProfImages[index],
                              color: blackColor.value,
                            ),
                            ListProfText[index]
                                .tr
                                .text
                                .fontFamily(medium)
                                .size(12)
                                .color(blackColor.value)
                                .make(),
                            ListProfSubText[index]
                                .text
                                .fontFamily(medium)
                                .size(12)
                                .color(blackColor.value)
                                .make(),
                          ],
                        ),
                        VxDivider(
                          color: lightColor.value,
                          endIndent: 30,
                          indent: 30,
                          type: VxDividerType.vertical,
                          width: 2,
                        ),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 9)
                        .width(context.screenWidth / 3)
                        .make();
                  },
                )
                    .box
                    .height(context.screenHeight / 9)
                    .width(context.screenWidth)
                    .make(),
                TabBar(
                  controller: tabController,
                  labelColor: blackColor.value,
                  unselectedLabelColor: unSelectedTapBarColor,
                  indicatorColor: blackColor.value,
                  tabs: [
                    Tab(
                      text: products.tr,
                    ),
                    Tab(
                      text: Brief.tr,
                    ),
                    Tab(
                      text: Courses.tr,
                    ),
                  ],
                ),
                TabBarView(
                  controller: tabController,
                  children: [
                    Center(
                      child: productsScreen(),
                    ),
                    Center(
                      child: BriefScreen(),
                    ),
                    Center(
                      child: CoursesScreen(),
                    ),
                  ],
                )
                    .box
                    .height(context.screenHeight / 1.5)
                    // .color(greenColor)
                    .make(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
