import '../../../../common/widgets/custom_button.dart';
import '../../controller/home_page_controller.dart';

class BrowseCategoriesScreen extends StatefulWidget {
  const BrowseCategoriesScreen({super.key});

  @override
  State<BrowseCategoriesScreen> createState() => _BrowseCategoriesScreenState();
}

class _BrowseCategoriesScreenState extends State<BrowseCategoriesScreen> {
  Future<void> _refreshData() async {
    // Your refresh logic goes here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: searchByCategories.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrowseCategories.tr.text
                      .fontFamily(bold)
                      .color(blackColor.value)
                      .size(24)
                      .make(),
                  20.heightBox,
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: context.height / 5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImagesCam),
                            ],
                          ),
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
                      )
                          .box
                          .height(context.screenHeight / 3)
                          .color(lightColor.value)
                          .padding(EdgeInsets.all(8))
                          // .margin(EdgeInsets.all(8))
                          .roundedSM
                          .width(context.screenWidth / 4)
                          .make();
                    },
                  )
                      .box
                      .height(context.screenHeight)
                      // .margin(EdgeInsets.all(20))
                      .rounded
                      .make(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
