import '../../../../common/widgets/custom_button.dart';
import '../../controller/home_page_controller.dart';

class PopularArtistsScreen extends StatefulWidget {
  const PopularArtistsScreen({super.key});

  @override
  State<PopularArtistsScreen> createState() => _PopularArtistsScreenState();
}

class _PopularArtistsScreenState extends State<PopularArtistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: searchByCategories.tr),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TheMostProminentArtists.tr.text
                    .fontFamily(bold)
                    .color(blackColor.value)
                    .size(24)
                    .make(),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [RankingBottomSheet(), FilterBottomSheet()],
                ),
                20.heightBox,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height / 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: context.screenHeight / 7,
                              width: context.screenWidth / 2.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        BGImage,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                        Positioned(
                          top: context.screenHeight / 10,
                          left: context.screenWidth / 15,
                          right: context.screenWidth / 15,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: whiteColor.value,
                                backgroundImage: AssetImage(
                                  UserImage,
                                ),
                              ),
                              15.heightBox,
                              ' كاتي سانت جون'
                                  .text
                                  .fontFamily(bold)
                                  .size(14)
                                  .color(blackColor.value)
                                  .make(),
                              10.heightBox,
                              'تصوير سينمائي'
                                  .text
                                  .fontFamily(medium)
                                  .size(12)
                                  .color(blackColor.value)
                                  .make(),
                            ],
                          ),
                        )
                      ],
                    )
                        .box
                        .height(context.screenHeight / 4)
                        .color(lightColor.value)
                        //.padding(EdgeInsets.all(8))
                        .margin(EdgeInsets.all(8))
                        .roundedSM
                        .width(context.screenWidth / 2.5)
                        .make()
                        .onTap(() {
                      print(index);
                    });
                  },
                )
                // .box
                // .height(context.screenHeight / 1.4)
                // // .margin(EdgeInsets.all(20))
                // .rounded
                // .make(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
