import 'dart:async';

import 'package:shimmer/shimmer.dart';

import '../../constant/const.dart';
import '../../features/home_page/screens/search/search_screen.dart';
import '../widgets/custom_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  final BuildContext context;

  CustomAppBar({required this.tabController, required this.context});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height / 2.5);
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  bool _isLoading = true;

  @override
  void initState() {
    _loadContent();
    super.initState();
  }

  void _loadContent() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget buildImageShimmer() {
    return Shimmer.fromColors(
      baseColor: greyColor[300]!,
      highlightColor: greyColor[100]!,
      child: Container(
        color: whiteColor.value,
        width: context.screenWidth,
        height: context.screenHeight / 2.5,
      ),
    );
  }

  // late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Container(
      // toolbarHeight: context.screenHeight / 2.5,
      child: Stack(
        children: [
          _isLoading
              ? buildImageShimmer()
              : Image.asset(
                  BGImage,
                  width: context.screenWidth,
                  height: context.screenHeight / 2.5,
                  fit: BoxFit.fill,
                ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: context.screenHeight / 2.3,
              width: context.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(BGShadow),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.screenHeight / 25,
                  horizontal: context.screenWidth / 38,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: SvgPicture.asset(menuDrawer),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                            );
                          },
                        ),
                        TheBiggestAnd.tr.text.white
                            .fontFamily(bold)
                            .size(20)
                            .make(),
                        SizedBox(),
                        SizedBox()
                      ],
                    ),
                    10.heightBox,
                    PhotographyEquipment.tr.text.white
                        .fontFamily(bold)
                        .size(20)
                        .make(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 45,
                        width: 160,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xFF535353),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          controller: widget.tabController,
                          indicator: BoxDecoration(
                              color: Color(0xFF707070),
                              borderRadius: BorderRadius.circular(25.0)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            Tab(
                              text: Leasing.tr,
                            ),
                            Tab(
                              text: buying.tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //     child: TabBarView(
                    //   controller: tabController,
                    //   children: [
                    //     Center(
                    //       child: 'DealsScreen'
                    //           .text
                    //           .fontFamily(medium)
                    //           .size(12)
                    //           .make(),
                    //     ),
                    //     Center(
                    //       child: 'EndedScreen'.text.make(),
                    //     ),
                    //   ],
                    // )),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  FindPhotographyEquipment.tr,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: medium,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                                .box
                                .height(60)
                                .width(context.screenWidth / 2.5)
                                .make()
                          ],
                        )
                            .box
                            .height(45)
                            .width(context.screenWidth / 1.8)
                            .rounded
                            .border(color: whiteColor.value, width: 1)
                            .make(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                            ),
                            20.widthBox,
                            'الرياض'
                                .tr
                                .text
                                .white
                                .fontFamily(medium)
                                .size(10)
                                .make(),
                          ],
                        )
                            .box
                            .height(45)
                            .width(context.screenWidth / 2.8)
                            .rounded
                            .border(color: whiteColor.value, width: 1)
                            .make(),
                      ],
                    ),
                    20.heightBox,
                    CustomButton(
                      text: research.tr,
                      textColor: whiteColor.value,
                      backgroundColor: redColor,
                      borderColor: redColor,
                      onPressed: () {
                        Get.to(
                          () => searchScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ).box.height(56).width(context.screenWidth - 40).make(),
                  ],
                ),
              ),
            ),
          )
        ],
      )
          .box
          .height(context.screenHeight / 2.5)
          .width(context.screenWidth)
          .make(),
    );
  }
}
