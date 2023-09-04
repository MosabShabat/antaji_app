import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import '../../features/home_page/screens/search/search_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  final BuildContext context;
  final String title;
  final String image;
  final String city;

  CustomAppBar(
      {required this.tabController,
      required this.context,
      required this.title,
      required this.image,
      required this.city});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height / 2.5);
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight / 2.2,
      width: context.screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            widget.image,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            // vertical: 12,
            horizontal: 12,
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
                  Container(
                    child: Column(
                      children: [
                        15.heightBox,
                        '${widget.title}'
                            .text
                            .white
                            .maxLines(2)
                            .fontFamily(bold)
                            .size(16)
                            .lineHeight(1.5)
                            .center
                            .make(),
                      ],
                    ),
                  )
                      .box
                      .height(context.screenHeight / 14)
                      // .color(greenColor)
                      .width(context.screenWidth / 1.3)
                      .make(),
                  SizedBox(),
                  SizedBox()
                ],
              ),
              30.heightBox,

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
                      ).box.height(60).width(context.screenWidth / 2.5).make()
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
                      '${widget.city}'
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  research.tr.text
                      .fontFamily(bold)
                      .size(18)
                      .color(Colors.white)
                      .make()
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 18)
                  .rounded
                  .color(redColor)
                  .make()
                  .onTap(() {
                Get.to(
                  () => searchScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
            ],
          ),
        ),
      ),
    ).box.height(context.screenHeight / 2.5).width(context.screenWidth).make();
  }
}
