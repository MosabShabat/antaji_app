import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/artists/screens/portfolio/user_video_screen.dart';
import 'package:antaji_app/models/business_artists_model.dart';
import 'package:lottie/lottie.dart';

import '../../../../constant/const.dart';

class videosScreen extends StatefulWidget {
  final String url;
  final String uuid;
  const videosScreen({super.key, required this.url, required this.uuid});

  @override
  State<videosScreen> createState() => _videosScreenState();
}

class _videosScreenState extends State<videosScreen> {
  var art_controller = Get.put(ArtistsController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await art_controller.getBusinessArtists(
        type: 2,
        url: widget.url,
      );
    });
    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getBusinessArtists(
      type: 2,
      url: widget.url,
      refresh: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => art_controller.isDataBusinessArtistsLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      art_controller.videos_artists_var.isEmpty
                          ? Column(
                              children: [
                                Lottie.asset(NoResults),
                                ThereIsNoDataYet.tr.text
                                    .fontFamily(bold)
                                    .size(20)
                                    .color(blackColor.value)
                                    .make()
                              ],
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  art_controller.videos_artists_var.length,
                              itemBuilder: (context, index) {
                                VideosModel data_videos =
                                    art_controller.videos_artists_var[index];
                                return Row(
                                  children: [
                                    Container(
                                        width: context.screenWidth / 2.5,
                                        height: context.screenHeight / 7,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${data_videos.image!}'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                '${data_videos.time!}'
                                                    .text
                                                    .fontFamily(bold)
                                                    .size(10)
                                                    .color(Colors.white)
                                                    .make(),
                                              ],
                                            )
                                                .box
                                                .width(context.screenWidth / 8)
                                                .height(
                                                    context.screenHeight / 30)
                                                .color(Colors.black
                                                    .withOpacity(0.6))
                                                .customRounded(
                                                    BorderRadius.only(
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                ))
                                                .make(),
                                          ],
                                        )).onTap(() {
                                      Get.to(
                                        () => UserVideoScreen(
                                          url: data_videos.video!,
                                          uuidUser: widget.uuid,
                                          uuidVideo: data_videos.uuid!,
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    }),
                                    10.widthBox,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        '${data_videos.title!}'
                                            .text
                                            .fontFamily(bold)
                                            .size(14)
                                            .color(blackColor.value)
                                            .make(),
                                        '${data_videos.time!}'
                                            .text
                                            .fontFamily(regular)
                                            .size(12)
                                            .color(blackColor.value)
                                            .make(),
                                        '${data_videos.view!}'
                                            .text
                                            .fontFamily(regular)
                                            .size(12)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    )
                                  ],
                                )
                                    .box
                                    .height(context.screenHeight / 6)
                                    //.color(greenColor)
                                    .margin(EdgeInsets.symmetric(vertical: 12))
                                    .make();
                              },
                            )
                      //.box.height(context.screenHeight / 1.8).make()
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
