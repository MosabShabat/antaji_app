import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/portfolio/pictures_screen.dart';
import 'package:antaji_app/features/artists/portfolio/videos_screen.dart';

class exhibitionScreen extends StatefulWidget {
  const exhibitionScreen({super.key});

  @override
  State<exhibitionScreen> createState() => _exhibitionScreenState();
}

class _exhibitionScreenState extends State<exhibitionScreen>
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
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            Container(
              height: 45,
              width: context.screenWidth,
              decoration: BoxDecoration(
                  color: lightColor.value, borderRadius: BorderRadius.circular(25.0)),
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
                  child: picturesScreen(),
                ),
                Center(
                  child: videosScreen(),
                ),
              ],
            ).box.height(context.screenHeight / 1.8).make(),
          ],
        ),
      ),
    );
  }
}
