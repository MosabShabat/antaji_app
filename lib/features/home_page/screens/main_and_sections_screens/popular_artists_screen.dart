import 'package:antaji_app/common/utils/video_player_met.dart';
import 'package:antaji_app/models/product_data.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../controller/home_page_controller.dart';

class PopularArtistsScreen extends StatefulWidget {
  final String title;
  final String url;
  final int type;
  const PopularArtistsScreen(
      {super.key, required this.title, required this.url, required this.type});

  @override
  State<PopularArtistsScreen> createState() => _PopularArtistsScreenState();
}

class _PopularArtistsScreenState extends State<PopularArtistsScreen> {
  var controller_home_pag_var = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller_home_pag_var.getSeeAll(
        type: widget.type,
        url: widget.url,
        refresh: true,
      );
    });
  }

  Future<void> _refreshData() async {
    await controller_home_pag_var.getSeeAll(
      refresh: true,
      type: widget.type,
      url: widget.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(controller_home_pag_var.prominent_artists_var.length);
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: searchByCategories.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => controller_home_pag_var.isDataSeeAllLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          '${widget.title}'
                              .text
                              .fontFamily(bold)
                              .size(24)
                              .color(blackColor.value)
                              .make(),
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
                            itemCount: controller_home_pag_var
                                .prominent_artists_var.length,
                            itemBuilder: (context, index) {
                              ProminentArtists data = controller_home_pag_var
                                  .prominent_artists_var[index];
                              print('----------------------');
                              print(controller_home_pag_var
                                  .prominent_artists_var.length);
                              print('----------------------');
                              print('**********************');
                              print(data.video);
                              // print(_controllers.length);
                              print('**********************');

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
                                    print(index);
                                  })
                                  .box
                                  .height(context.screenHeight / 4)
                                  .width(context.screenWidth / 2.5)
                                  .make();
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
