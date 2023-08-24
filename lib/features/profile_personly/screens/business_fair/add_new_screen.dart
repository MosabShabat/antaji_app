import 'package:antaji_app/features/profile_personly/screens/business_fair/add_new_photo_screen.dart';
import 'package:antaji_app/features/profile_personly/screens/business_fair/add_new_video_screen.dart';

import '../../../../constant/const.dart';

class addNewScreen extends StatefulWidget {
  const addNewScreen({super.key});

  @override
  State<addNewScreen> createState() => _addNewScreenState();
}

class _addNewScreenState extends State<addNewScreen>
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
      appBar: AppBar(),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addNew.tr.text
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
                    child: addNewPhotoScreen(),
                  ),
                  Center(
                    child: addNewVideo(),
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
