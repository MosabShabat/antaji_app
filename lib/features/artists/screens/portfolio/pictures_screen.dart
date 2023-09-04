import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/artists/screens/portfolio/full_screen_pictures_screen.dart';
import 'package:antaji_app/models/business_artists_model.dart';
import 'package:lottie/lottie.dart';

class picturesScreen extends StatefulWidget {
  final String url;
  const picturesScreen({super.key, required this.url});

  @override
  State<picturesScreen> createState() => _picturesScreenState();
}

class _picturesScreenState extends State<picturesScreen> {
  var art_controller = Get.put(ArtistsController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await art_controller.getBusinessArtists(
        type: 1,
        url: widget.url,
      );
    });
    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getBusinessArtists(
      type: 1,
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
                      children: [
                        art_controller.images_artists_var.isEmpty
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
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: context.height / 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount:
                                    art_controller.images_artists_var.length,
                                itemBuilder: (context, index) {
                                  ImagesModel data_images =
                                      art_controller.images_artists_var[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                        //color: greenColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '${data_images.image!}'),
                                          fit: BoxFit.fill,
                                        )),
                                  ).box.make().onTap(() {
                                    Get.to(
                                      () => FullScreenPicturesScreen(
                                        data_images:
                                            art_controller.images_artists_var,
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  });
                                }),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
