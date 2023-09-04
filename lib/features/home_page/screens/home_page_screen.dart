import 'dart:async';
import 'package:antaji_app/features/home/screens/home_screen.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:antaji_app/models/product_data.dart';
import 'package:lottie/lottie.dart';
import '../../../common/utils/app_bar_widget.dart';
import '../../../common/utils/prod_list_view.dart';
import '../../../common/widgets/Shimmer_widgets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/drawer.dart';
import '../../home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final int page;
  const HomePage({super.key, required this.page});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomePageController homePageController = HomePageController();
  var controller_home_pag_var = Get.put(HomePageController());
  int x = 1;
  @override
  void initState() {
    tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.page);

    Future.delayed(Duration.zero, () {
      controller_home_pag_var.getHome(refresh: true);
    });
    x = 1;
    super.initState();
  }

  Future<void> _refreshData() async {
    x = 1;
    await controller_home_pag_var.getHome(refresh: true);
  }

  void navigateToHomeScreenWithTabIndex(int tabIndex) {
    Get.offAll(() => HomeScreen(initialTabIndex: tabIndex),
        transition: Transition.rightToLeft, arguments: tabIndex);
  }

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController);
    setState(() {});
    return Scaffold(
      backgroundColor: whiteColor.value,
      drawer: CustomDrawer(),
      body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  if (controller_home_pag_var.isDataLoading.value) {
                    return Column(
                      children: [
                        buildImageAppBarShimmer(context),
                        50.heightBox,
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildImageShimmer(context.screenHeight),
                              30.heightBox,
                              buildRowShimmer(context),
                              30.heightBox,
                              buildListViewShimmer(
                                context.screenHeight,
                                context.screenWidth,
                              ),
                              30.heightBox,
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (controller_home_pag_var.name_translate == null ||
                      controller_home_pag_var.image == null ||
                      controller_home_pag_var.title == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          NoResults,
                        ),
                        thereIsNoInternet.tr.text
                            .fontFamily(bold)
                            .size(20)
                            .color(blackColor.value)
                            .make(),
                      ],
                    )
                        .box
                        .width(context.screenWidth)
                        .height(context.screenHeight)
                        .make();
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          tabController: tabController,
                          context: context,
                          city: controller_home_pag_var.name_translate!,
                          image: controller_home_pag_var.image!,
                          title: controller_home_pag_var.title!,
                        ),
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: BrowseOurService.tr.text
                              .color(blackColor.value)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: context.height / 15,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            var data = controller_home_pag_var
                                .services_model_Var[index];
                            return GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  Get.to(
                                    () => RentScreen(
                                      title: data.nameTranslate!,
                                      url: 'leasing?page=',
                                    ),
                                    transition: Transition.rightToLeft,
                                  );
                                } else if (index == 1) {
                                  Get.to(
                                    () => RentScreen(
                                      title: data.nameTranslate!,
                                      url: 'sell_buy',
                                    ),
                                    transition: Transition.rightToLeft,
                                  );
                                } else if (index == 2) {
                                  navigateToHomeScreenWithTabIndex(2);
                                } else if (index == 3) {
                                  navigateToHomeScreenWithTabIndex(3);
                                }
                              },
                              child: Row(
                                children: [
                                  Lottie.asset(
                                    ListImagesHome[index],
                                    width: context.screenWidth / 10,
                                    height: context.screenHeight / 20,
                                  ),
                                  10.widthBox,
                                  '${data.nameTranslate}'
                                      .text
                                      .color(blackColor.value)
                                      .fontFamily(medium)
                                      .size(14)
                                      .make()
                                ],
                              )
                                  .box
                                  .height(60)
                                  .rounded
                                  .width(context.screenWidth / 2.5)
                                  .border(color: greyColor, width: 1)
                                  .make(),
                            );
                          },
                        )
                            .box
                            .margin(EdgeInsets.symmetric(
                              horizontal: 20,
                            ))
                            .make(),
                        20.heightBox,
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller_home_pag_var.prod_data_var.length,
                          itemBuilder: (context, indexMain) {
                            var data = controller_home_pag_var
                                .prod_data_var[indexMain];
                            if (data.dataType! == 'category') {
                              return Column(
                                children: [
                                  rowSpBet(
                                    text: controller_home_pag_var
                                        .prod_data_var[indexMain].title!,
                                    onPressed: () {
                                      Get.to(
                                        () => BrowseCategoriesScreen(
                                          title: controller_home_pag_var
                                              .prod_data_var[indexMain].title!,
                                          url: '?page',
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductDataDet!
                                        .length,
                                    itemBuilder: (context, index) {
                                      ProductDataDet data_det =
                                          controller_home_pag_var
                                              .prod_data_var[indexMain]
                                              .dataProductDataDet![index];

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                '${data_det.image!}',
                                                width:
                                                    context.screenWidth / 4.8,
                                                height:
                                                    context.screenHeight / 14,
                                                fit: BoxFit.contain,
                                              ),
                                              20.heightBox,
                                              '${data_det.nameTranslate}'
                                                  .text
                                                  .fontFamily(bold)
                                                  .size(12)
                                                  .color(blackColor.value)
                                                  .make(),
                                              10.heightBox,
                                              '${data_det.productCount}  ${product.tr}'
                                                  .text
                                                  .fontFamily(medium)
                                                  .size(12)
                                                  .color(blackColor.value)
                                                  .make(),
                                            ],
                                          ),
                                        ],
                                      )
                                          .box
                                          .height(context.screenHeight / 10)
                                          .color(lightColor.value)
                                          .padding(EdgeInsets.all(8))
                                          .margin(EdgeInsets.all(8))
                                          .roundedSM
                                          .width(context.screenWidth / 4)
                                          .make()
                                          .onTap(() {
                                        print(
                                          data_det.uuid!,
                                        );
                                        Get.to(
                                          () => audioEquipmentScreen(
                                            title: data_det.nameTranslate!,
                                            url: '/${data_det.uuid!}',
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      });
                                    },
                                  )
                                      .box
                                      .height(context.screenHeight / 5.3)
                                      .width(context.screenWidth)
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 20))
                                      .make(),
                                ],
                              );
                            }
                            if (data.dataType! == 'product') {
                              return Column(
                                children: [
                                  20.heightBox,
                                  rowSpBet(
                                    text: controller_home_pag_var
                                        .prod_data_var[indexMain].title!,
                                    onPressed: () {
                                      Get.to(
                                        () => PopularProductsForRentScreen(
                                          type: 1,
                                          url: controller_home_pag_var
                                              .prod_data_var[indexMain].url!,
                                          title: controller_home_pag_var
                                              .prod_data_var[indexMain].title!,
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                  ),
                                  ProdListView(
                                    type: 'products',
                                    backgroundColor: whiteColor.value,
                                    count: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductDetails!
                                        .length,
                                    dataDet: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductDetails!,
                                  )
                                      .box
                                      .height(context.screenHeight / 3.5)
                                      .width(context.screenWidth)
                                      .make(),
                                  20.heightBox,
                                ],
                              );
                            }
                            if (data.dataType! == 'location') {
                              return Column(
                                children: [
                                  20.heightBox,
                                  rowSpBet(
                                    text: controller_home_pag_var
                                        .prod_data_var[indexMain].title!,
                                    onPressed: () {
                                      navigateToHomeScreenWithTabIndex(3);
                                    },
                                  ),
                                  ProdListView(
                                    type: 'locations',
                                    backgroundColor: whiteColor.value,
                                    count: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductDetails!
                                        .length,
                                    dataDet: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductDetails!,
                                  )
                                      .box
                                      .height(context.screenHeight / 3.5)
                                      .width(context.screenWidth)
                                      .make(),
                                  20.heightBox,
                                ],
                              );
                            }
                            print('777777777777777');
                            //  print(x == 1);
                            print('777777777777777');
                            // if (x == 1) {
                            //   x = 2;
                            //   return Row(
                            //     children: [
                            //       GestureDetector(
                            //           onTap: () async {
                            //             try {
                            //               String url =
                            //                   '${controller_home_pag_var.link_url!}';
                            //               print(url);
                            //               await launch(url);
                            //             } catch (e) {
                            //               print('Error launching URL: $e');
                            //             }
                            //           },
                            //           child: Image.network(
                            //             '${controller_home_pag_var.image_type!}',
                            //             width: context.screenWidth,
                            //             fit: BoxFit.cover,
                            //           )),
                            //     ],
                            //   )
                            //       .box
                            //       .height(context.screenHeight / 4.5)
                            //       .width(context.screenWidth)
                            //       .make();
                            // }

                            if (data.dataType! == 'artist') {
                              return Column(
                                children: [
                                  20.heightBox,
                                  rowSpBet(
                                    text: controller_home_pag_var
                                        .prod_data_var[indexMain].title!,
                                    onPressed: () {
                                      Get.to(
                                        () => PopularArtistsScreen(
                                          title: controller_home_pag_var
                                              .prod_data_var[indexMain].title!,
                                          type: 2,
                                          url: controller_home_pag_var
                                              .prod_data_var[indexMain].url!,
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                  ),
                                  ArtistProfListView(
                                    count: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductDetails!
                                        .length,
                                    dataDet: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProminentArtists!,
                                    backgroundColor: lightColor.value,
                                  )
                                      .box
                                      .height(context.screenHeight / 3)
                                      .width(context.screenWidth)
                                      .make(),
                                  20.heightBox,
                                ],
                              );
                            }
                            if (data.dataType! == 'business_video') {
                              return Column(
                                children: [
                                  rowSpBet(
                                    text: controller_home_pag_var
                                        .prod_data_var[indexMain].title!,
                                    onPressed: () {
                                      Get.to(
                                        () => ProProductionScreen(
                                          type: 3,
                                          url: controller_home_pag_var
                                              .prod_data_var[indexMain].url!,
                                          title: controller_home_pag_var
                                              .prod_data_var[indexMain].title!,
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                  ),
                                  ProProListView(
                                    backgroundColor: whiteColor.value,
                                    count: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductOfProfessionals!
                                        .length,
                                    dataDet: controller_home_pag_var
                                        .prod_data_var[indexMain]
                                        .dataProductOfProfessionals!,
                                  )
                                      .box
                                      .height(context.screenHeight / 3)
                                      .width(context.screenWidth)
                                      .make(),

                                  //ProProListView
                                  30.heightBox,
                                ],
                              );
                            }

                            return Container();
                          },
                        )
                      ],
                    );
                  }
                })
              ],
            ),
          )),
    );
  }
}
