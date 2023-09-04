import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/artists/screens/portfolio/brief_screen.dart';
import 'package:antaji_app/features/artists/screens/portfolio/products_screen.dart';

import 'courses_screen.dart';
import 'exhibition_screen.dart';

class PortfolioScreen extends StatefulWidget {
  final String uuid;
  const PortfolioScreen({super.key, required this.uuid});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with TickerProviderStateMixin {
  var art_controller = Get.put(ArtistsController());

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await art_controller.getUserDetails(widget.uuid);
    });
    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getUserDetails(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => art_controller.isDataUsersLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : art_controller.users_model_var == null
                  ? Center(
                      child: ThereIsNoDataYet.tr.text
                          .fontFamily(bold)
                          .size(20)
                          .color(blackColor.value)
                          .make(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            art_controller.users_model_var!.coverPhoto == null
                                ? Image.network(
                                    'https://antaji.metricshop.net/upload/user/cover/64a54f6bdcf76.jpg',
                                    width: context.screenWidth,
                                    height: context.screenHeight / 3,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    '${art_controller.users_model_var!.coverPhoto!}',
                                    width: context.screenWidth,
                                    height: context.screenHeight / 3,
                                    fit: BoxFit.fill,
                                  ),
                            Positioned(
                              bottom: 20,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: whiteColor.value,
                                      radius: context.screenWidth / 6.9,
                                      child: CircleAvatar(
                                        backgroundColor: whiteColor.value,
                                        radius: context.screenWidth / 7,
                                        backgroundImage: art_controller
                                                    .users_model_var!
                                                    .personalPhoto ==
                                                null
                                            ? NetworkImage(
                                                'https://antaji.metricshop.net/upload/user/personal/64a3fcdfa0364.jpg',
                                              )
                                            : NetworkImage(
                                                art_controller.users_model_var!
                                                    .personalPhoto!,
                                              ),
                                      ),
                                    ),
                                    10.widthBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            15.heightBox,
                                            Row(
                                              children: [
                                                '${art_controller.users_model_var!.name!}'
                                                    .text
                                                    .fontFamily(bold)
                                                    .color(blackColor.value)
                                                    .size(16)
                                                    .make(),
                                                10.widthBox,
                                                art_controller.users_model_var!
                                                        .isVerified!
                                                    ? SvgPicture.asset(
                                                        verifyIcon)
                                                    : SizedBox(),
                                              ],
                                            ),
                                            10.heightBox,
                                            art_controller.users_model_var!
                                                        .specialization ==
                                                    null
                                                ? SizedBox()
                                                : '${art_controller.users_model_var!.specialization!}'
                                                    .text
                                                    .fontFamily(medium)
                                                    .color(blackColor.value)
                                                    .size(12)
                                                    .make()
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            communication.tr.text
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
                                            .make(),
                                        1.widthBox,
                                      ],
                                    )
                                        .box
                                        .width(context.screenWidth / 1.5)
                                        // .color(greenColor)
                                        .make(),
                                  ],
                                ).box.width(context.screenWidth).make(),
                              ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      10.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                              art_controller.users_model_var!.skills!.isEmpty
                                  ? SizedBox()
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: art_controller
                                          .users_model_var!.skills!.length,
                                      itemBuilder: (context, index) {
                                        var SkillsData = art_controller
                                            .users_model_var!.skills![index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            '${SkillsData.nameTranslate}'
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
                                      .make(),
                              20.heightBox,
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  var ListProfSubTextApi = [
                                    art_controller
                                        .users_model_var!.positiveReviews,
                                    art_controller.users_model_var!.response,
                                    art_controller.users_model_var!.createdAt,
                                  ];
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                          '${ListProfSubTextApi[index]}'
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
                                    text: Brief.tr,
                                  ),
                                  Tab(
                                    text: exhibition.tr,
                                  ),
                                  Tab(
                                    text: products.tr,
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
                                    child: BriefScreen(
                                      data: art_controller.users_model_var!,
                                    ),
                                  ),
                                  Center(
                                    child: exhibitionScreen(
                                      data: art_controller.users_model_var!,
                                    ),
                                  ),
                                  Center(
                                    child: productsScreen(
                                      data: art_controller.users_model_var!,
                                    ),
                                  ),
                                  Center(
                                    child: CoursesScreen(
                                      data: art_controller.users_model_var!,
                                    ),
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
        ),
      ),
    );
  }
}
