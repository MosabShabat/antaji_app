import 'dart:async';
import 'package:antaji_app/features/home/screens/home_screen.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:lottie/lottie.dart';
import '../../../common/utils/app_bar_widget.dart';
import '../../../common/utils/prod_list_view.dart';
import '../../../common/widgets/Shimmer_widgets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/drawer.dart';
import '../../home/controller/home_controller.dart';
import 'buying_and_renting_a_product/product_details_add_screen.dart';
import 'buying_and_renting_a_product/product_details_screen.dart';

class HomePage extends StatefulWidget {
  final int page;
  //mosab shabat
  const HomePage({super.key, required this.page});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isLoading = true;
  HomePageController homePageController = HomePageController();
  var controller = Get.find<HomeController>();
  @override
  void initState() {
    tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.page);
    _loadContent();
    super.initState();
  }

  Future<void> _refreshData() async {
    // Your refresh logic goes here
  }
  void navigateToHomeScreenWithTabIndex(int tabIndex) {
    Get.offAll(() => HomeScreen(initialTabIndex: tabIndex),
        transition: Transition.rightToLeft, arguments: tabIndex);
  }

  void _loadContent() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController);
    return Scaffold(
      backgroundColor: whiteColor.value,
      drawer: CustomDrawer(),
      body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  tabController: tabController,
                  context: context,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height / 15,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _isLoading
                        ? buildImageShimmer(context.screenWidth)
                        : GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Get.to(
                                  () => RentScreen(),
                                  transition: Transition.rightToLeft,
                                );
                              } else if (index == 1) {
                                Get.to(
                                  () => BuyingAndSellingScreen(),
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
                                ListTextSerHome[index]
                                    .tr
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
                    // .height(context.screenHeight / 6)
                    .margin(EdgeInsets.all(20))
                    .make(),
                _isLoading
                    ? buildRowShimmer(context)
                    : rowSpBet(
                        text: BrowseCategories,
                        onPressed: () {
                          Get.to(
                            () => BrowseCategoriesScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _isLoading
                            ? buildListViewShimmer(context.screenHeight)
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(ImagesCam),
                                  20.heightBox,
                                  'كاميرات السينما'
                                      .text
                                      .fontFamily(bold)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                  10.heightBox,
                                  '633 منتج'
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
                      Get.to(
                        () => audioEquipmentScreen(),
                        transition: Transition.rightToLeft,
                      );
                    });
                  },
                )
                    .box
                    .height(context.screenHeight / 5.3)
                    .width(context.screenWidth)
                    .margin(EdgeInsets.symmetric(horizontal: 20))
                    .make(),
                20.heightBox,
                _isLoading
                    ? buildRowShimmer(context)
                    : rowSpBet(
                        text: PopularProductsForRent,
                        onPressed: () {
                          Get.to(
                            () => PopularProductsForRentScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                ProdListView(
                  backgroundColor: whiteColor.value,
                  image: imageCamSta,
                  title: 'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                  Price: '300 ر.س / يوم',
                  onTap: () {
                    Get.to(
                      () => ProductDetailsAddScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                )
                    .box
                    .height(context.screenHeight / 3.5)
                    .width(context.screenWidth)
                    .make(),
                20.heightBox,
                rowSpBet(
                  text: NewlyListedForRent,
                  onPressed: () {
                    Get.to(
                      () => PopularProductsForRentScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
                ProdListView(
                  backgroundColor: whiteColor.value,
                  image: imageCamSta,
                  title: 'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                  Price: '300 ر.س / يوم',
                  onTap: () {
                    Get.to(
                      () => ProductDetailsAddScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                )
                    .box
                    .height(context.screenHeight / 3.5)
                    .width(context.screenWidth)
                    .make(),
                Image.asset(
                  imageSlider,
                  width: context.screenWidth,
                  // height: context.screenHeight / 5,
                  fit: BoxFit.cover,
                ),
                30.heightBox,
                Container(
                  width: context.screenWidth,
                  height: context.screenHeight / 2.9,
                  color: lightColor.value,
                  child: Column(
                    children: [
                      rowSpBet(
                        text: popularProductsForSale,
                        onPressed: () {
                          Get.to(
                            () => PopularProductsForRentScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                      ProdListView(
                        backgroundColor: lightColor.value,
                        image: imageCamSta,
                        title: 'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                        Price: '300 ر.س / يوم',
                        onTap: () {
                          Get.to(
                            () => ProductDetailsScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      )
                          .box
                          .height(context.screenHeight / 3.5)
                          .width(context.screenWidth)
                          .make(),
                    ],
                  ),
                ),
                30.heightBox,
                Container(
                  width: context.screenWidth,
                  height: context.screenHeight / 2.8,
                  color: lightColor.value,
                  child: Column(
                    children: [
                      rowSpBet(
                        text: NewlyListedForSale,
                        onPressed: () {
                          Get.to(
                            () => PopularProductsForRentScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                      ProdListView(
                        backgroundColor: lightColor.value,
                        image: imageCamSta,
                        title: 'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                        Price: '300 ر.س / يوم',
                        onTap: () {
                          Get.to(
                            () => ProductDetailsAddScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      )
                          .box
                          .height(context.screenHeight / 3.5)
                          .width(context.screenWidth)
                          .make(),
                    ],
                  ),
                ),
                20.heightBox,
                rowSpBet(
                  text: TheMostProminentArtists,
                  onPressed: () {
                    Get.to(
                      () => PopularArtistsScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
                ArtistProfListView(
                  JobDes: 'تصوير سينمائي',
                  ProfImage: UserImage,
                  backgroundColor: lightColor.value,
                  backgroundImage: BGImage,
                  name: ' كاتي سانت جون',
                )
                    // 'تصوير سينمائي',
                    .box
                    .height(context.screenHeight / 3)
                    .width(context.screenWidth)
                    .make(),
                20.heightBox,
                rowSpBet(
                  text: LatestFilmingLocations,
                  onPressed: () {},
                ),
                ProdListView(
                  backgroundColor: whiteColor.value,
                  image: imageCamSta,
                  title: 'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                  Price: '300 ر.س / يوم',
                  onTap: () {
                    Get.to(
                      () => ProductDetailsAddScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                )
                    .box
                    .height(context.screenHeight / 3.5)
                    .width(context.screenWidth)
                    .make(),
                20.heightBox,
                rowSpBet(
                  text: ProPRODUCTION,
                  onPressed: () {
                    Get.to(
                      () => ProProductionScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
                ProProListView(
                  backgroundColor: whiteColor.value,
                  image: imageCamSta,
                  title: 'خائف | فيلم قصير (حائز على جائزة) 2019',
                  imageProf: UserImage,
                  name: 'كاتي سانت جون',
                )
                    .box
                    .height(context.screenHeight / 3)
                    .width(context.screenWidth)
                    .make(),

                //ProProListView
                30.heightBox,
              ],
            ),
          )),
    );
  }
}
