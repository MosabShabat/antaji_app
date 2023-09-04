import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/artists/screens/portfolio/course_details_screen.dart';
import 'package:antaji_app/models/users_model.dart';
import 'package:lottie/lottie.dart';

class CoursesScreen extends StatefulWidget {
  final UsersModel? data;
  const CoursesScreen({super.key, this.data});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  var art_controller = Get.put(ArtistsController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await art_controller.getBusinessArtists(
        type: 5,
        url: '${widget.data!.uuid!}/courses',
      );
    });
    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getBusinessArtists(
      type: 5,
      url: '${widget.data!.uuid!}/courses',
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
                        art_controller.courses_var.isEmpty
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
                                scrollDirection: Axis.vertical,
                                itemCount: art_controller.courses_var.length,
                                itemBuilder: (context, index) {
                                  var courses_data =
                                      art_controller.courses_var[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: context.screenWidth,
                                        height: context.screenHeight / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${courses_data.cover}'),
                                              fit: BoxFit.fitWidth,
                                            )),
                                        child: Center(
                                          child: CircleAvatar(
                                              radius: context.screenWidth / 18,
                                              backgroundColor:
                                                  Color(0xFF707070),
                                              child: SvgPicture.asset(
                                                video_play_icon,
                                                width: context.screenWidth / 18,
                                                height:
                                                    context.screenHeight / 36,
                                              )),
                                        ),
                                      ),
                                      20.heightBox,
                                      Text(
                                        '${courses_data.name}',
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontFamily: bold,
                                            fontSize: 12,
                                            color: blackColor.value),
                                      ),
                                      10.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          courses_data.isPurchased!
                                              ? Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          greenColor,
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.done,
                                                          color:
                                                              whiteColor.value,
                                                        ),
                                                      ),
                                                    ),
                                                    10.widthBox,
                                                    BuyingSucceeded.tr.text
                                                        .fontFamily(bold)
                                                        .size(14)
                                                        .color(greenColor)
                                                        .make()
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    '${courses_data.price!} ${courses_data.currency!} / '
                                                        .text
                                                        .fontFamily(bold)
                                                        .size(16)
                                                        .color(blackColor.value)
                                                        .make(),
                                                    Today.tr.text
                                                        .fontFamily(regular)
                                                        .size(14)
                                                        .color(blackColor.value)
                                                        .make(),
                                                  ],
                                                ),
                                          10.widthBox,
                                          '${courses_data.count}  ${videos.tr}'
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
                                      .height(context.screenHeight / 3.2)
                                      .color(whiteColor.value)
                                      .width(context.screenWidth / 1.5)
                                      .make()
                                      .onTap(() {
                                    Get.to(
                                      () => CourseDetailsScreen(
                                        uuid: courses_data.uuid!,
                                        cover_video: courses_data.cover!,
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  });
                                },
                              ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
