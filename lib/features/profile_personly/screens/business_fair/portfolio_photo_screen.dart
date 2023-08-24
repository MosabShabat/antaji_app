import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/profile_personly/screens/business_fair/add_new_screen.dart';
import 'package:antaji_app/features/profile_personly/screens/business_fair/photo_screen.dart';
import 'package:antaji_app/features/profile_personly/screens/business_fair/portfolio_video_screen.dart';

class PortfolioPhotoScreen extends StatefulWidget {
  const PortfolioPhotoScreen({super.key});

  @override
  State<PortfolioPhotoScreen> createState() => _PortfolioPhotoScreenState();
}

class _PortfolioPhotoScreenState extends State<PortfolioPhotoScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: blackColor.value,
                  ),
                ),
              )
                  .box
                  .width(context.screenWidth / 16)
                  .height(context.screenHeight / 32)
                  .withRounded(value: 8)
                  .border(
                    width: 2,
                    color: blackColor.value,
                  )
                  .make(),
              10.widthBox,
              AddANewJob.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.widthBox,
            ],
          ).onTap(() {
            Get.to(
              () => addNewScreen(),
              transition: Transition.rightToLeft,
            );
          })
        ],
      ),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BusinessFair.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Container(
                height: 45,
                width: context.screenWidth,
                decoration: BoxDecoration(
                    color: lightColor.value,
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                      color: blackColor.value,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: whiteColor.value,
                  unselectedLabelColor: blackColor.value,
                  tabs: [
                    Tab(
                      text: thePictures.tr,
                    ),
                    Tab(
                      text: videos.tr,
                    ),
                  ],
                ),
              ),
              20.heightBox,
              TabBarView(
                controller: tabController,
                children: [
                  Center(
                    child: PhotoScreen(),
                  ),
                  Center(
                    child: PortfolioVideoScreen(),
                  ),
                ],
              ).box.height(context.screenHeight).make(),
            ],
          ),
        ),
      ),
    );
  }
}
