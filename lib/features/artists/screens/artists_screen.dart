import 'package:antaji_app/common/utils/video_player_met.dart';
import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/artists/screens/city_change_screen.dart';
import 'package:antaji_app/features/artists/screens/portfolio/portfolio_screen.dart';
import 'package:antaji_app/models/product_data.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  var art_controller = Get.put(ArtistsController());
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    // await
    Future.delayed(Duration.zero, () {
      art_controller.getAllArtists();
    });
    // art_controller.getAllArtists();
    // });
    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getAllArtists(
      refresh: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: Obx(
            () => art_controller.isDataArtistsLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                title: artists.tr.text
                                    .fontFamily(bold)
                                    .size(24)
                                    .color(blackColor.value)
                                    .make(),
                                subtitle: ProvidingProfessional.tr.text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      LightLocationIcon,
                                      color: blackColor.value,
                                    ),
                                    5.widthBox,
                                    '${art_controller.name_translate_art}'
                                        .text
                                        .fontFamily(medium)
                                        .size(12)
                                        .color(blackColor.value)
                                        .make(),
                                    5.widthBox,
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: blackColor.value,
                                      size: 20,
                                    )
                                  ],
                                )
                                    .box
                                    .height(40)
                                    .width(context.screenWidth / 4)
                                    .color(lightColor.value)
                                    .withRounded(value: 24)
                                    .make()
                                    .onTap(() {
                                  Get.to(
                                    () => CityChangeScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                })),
                            20.heightBox,
                            MyTextField(
                                hintText: SearchForArtists.tr,
                                Radius: 50.0,
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                obscureText: false,
                                readOnly: false,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: blackColor.value,
                                )),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RankingBottomSheet(),
                                FilterBottomSheet()
                              ],
                            ),
                            20.heightBox,
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: context.height / 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemCount: art_controller
                                  .prominent_all_artists_var.length,
                              itemBuilder: (context, index) {
                                ProminentArtists data = art_controller
                                    .prominent_all_artists_var[index];

                                return Stack(
                                  children: [
                                    data.video == null
                                        ? Image.network(
                                            "https://antaji.metricshop.net/upload/user/cover/64a54f6bdcf76.jpg",
                                            fit: BoxFit.fill,
                                          )
                                            .box
                                            .width(context.screenWidth / 2.5)
                                            .height(context.screenHeight / 7)
                                            .rounded
                                            .color(greenColor)
                                            .withRounded(value: 12)
                                            .make()
                                        : videoPlayerMet(
                                            url: data.video!,
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
                                            backgroundImage: NetworkImage(
                                              '${data.personalPhoto!}',
                                            ),
                                          ),
                                          15.heightBox,
                                          '${data.name!}'
                                              .text
                                              .fontFamily(bold)
                                              .size(14)
                                              .color(blackColor.value)
                                              .make(),
                                          10.heightBox,
                                          '${data.specialization == null ? 'محمد' : data.specialization!}'
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
                                    .margin(EdgeInsets.all(8))
                                    .roundedSM
                                    .width(context.screenWidth / 2.5)
                                    .make()
                                    .onTap(() {
                                      Get.to(
                                        () => PortfolioScreen(
                                          uuid: data.uuid!,
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    })
                                    .box
                                    .height(context.screenHeight / 4)
                                    .width(context.screenWidth / 2.5)
                                    .make();
                              },
                            ),
                            20.heightBox,
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
