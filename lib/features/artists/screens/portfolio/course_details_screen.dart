import 'package:antaji_app/common/utils/video_player_met.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/artists/screens/portfolio/user_video_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/widgets/custom_button.dart';
import 'buy_the_course.dart';

class CourseDetailsScreen extends StatefulWidget {
  // final Widget DoneWid;
  // final bool isPay;
  final String cover_video;
  final String uuid;
  const CourseDetailsScreen(
      {super.key, required this.uuid, required this.cover_video});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  var art_controller = Get.put(ArtistsController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await art_controller.getCourseDetails(widget.uuid);
    });

    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getCourseDetails(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    // print('${art_controller.Course_details_model_var!.demonstrationVideo!}');
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: whiteColor.value,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => art_controller.isDataCourseDetailsLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : art_controller.Course_details_model_var == null
                  ? Center(
                      child: ThereIsNoDataYet.tr.text
                          .fontFamily(bold)
                          .size(20)
                          .color(blackColor.value)
                          .make(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CourseDetails.tr.text
                                .fontFamily(bold)
                                .size(24)
                                .color(blackColor.value)
                                .make(),
                          ),
                          20.heightBox,
                          Container(
                            width: context.screenWidth,
                            height: context.screenHeight / 5,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                image: DecorationImage(
                                  image: NetworkImage('${widget.cover_video}'),
                                  fit: BoxFit.fitWidth,
                                )),
                            child: Center(
                              child: CircleAvatar(
                                  radius: context.screenWidth / 18,
                                  backgroundColor: Color(0xFF707070),
                                  child: SvgPicture.asset(
                                    video_play_icon,
                                    width: context.screenWidth / 18,
                                    height: context.screenHeight / 36,
                                  )).onTap(() {
                                Get.to(
                                  () => UserVideoScreen(
                                    url: art_controller
                                        .Course_details_model_var!
                                        .demonstrationVideo!,
                                    uuidUser: '',
                                    uuidVideo: '',
                                  ),
                                  transition: Transition.rightToLeft,
                                );
                              }),
                            ),
                          ),
                          // Image.network(
                          //   '${art_controller.Course_details_model_var!.demonstrationVideo!}',
                          //   width: context.screenWidth,
                          //   height: context.screenHeight / 4,
                          //   fit: BoxFit.cover,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${art_controller.Course_details_model_var!.name!}',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    fontSize: 14,
                                    color: blackColor.value,
                                  ),
                                ),
                                20.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    art_controller.Course_details_model_var!
                                            .isPurchased!
                                        ? Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundColor: greenColor,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.done,
                                                    color: whiteColor.value,
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
                                        : '${art_controller.Course_details_model_var!.price!}  ${art_controller.Course_details_model_var!.currency!}'
                                            .text
                                            .fontFamily(bold)
                                            .size(14)
                                            //   .color(greenColor)
                                            .make(),
                                    '${art_controller.Course_details_model_var!.count!}  ${videos.tr}'
                                        .text
                                        .fontFamily(regular)
                                        .size(12)
                                        .color(blackColor.value)
                                        .make(),
                                  ],
                                ),
                                30.heightBox,
                                art_controller
                                        .Course_details_model_var!.isPurchased!
                                    ? SizedBox()
                                    : CustomButton(
                                        text: buyNow.tr,
                                        textColor: whiteColor.value,
                                        backgroundColor: blackColor.value,
                                        borderColor: blackColor.value,
                                        onPressed: () {
                                          Get.to(
                                            () => BuyTheCourseScreen(),
                                            transition: Transition.rightToLeft,
                                          );
                                        },
                                      )
                                        .box
                                        .height(60)
                                        .width(context.screenWidth)
                                        .make(),
                                30.heightBox,
                                Brief.tr.text
                                    .fontFamily(bold)
                                    .size(16)
                                    .color(blackColor.value)
                                    .make(),
                                20.heightBox,
                                Text(
                                  '${art_controller.Course_details_model_var!.details!}',
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    fontSize: 14,
                                    color: blackColor.value,
                                    height: 1.5,
                                  ),
                                ),
                                30.heightBox,
                                CourseVideos.tr.text
                                    .fontFamily(bold)
                                    .size(16)
                                    .color(blackColor.value)
                                    .make(),
                                30.heightBox,
                                art_controller.Course_details_model_var!.videos!
                                        .isEmpty
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
                                          mainAxisExtent: context.height / 7,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                        ),
                                        itemCount: art_controller
                                            .Course_details_model_var!
                                            .videos!
                                            .length,
                                        itemBuilder: (context, index) {
                                          var videos_data = art_controller
                                              .Course_details_model_var!
                                              .videos![index];
                                          return courseVideoMet(
                                            url: videos_data.attachment!,
                                            duration: videos_data.duration!,
                                          );
                                        }),
                                40.heightBox,
                                art_controller
                                        .Course_details_model_var!.isPurchased!
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    '${art_controller.Course_details_model_var!.owner!.image!}'),
                                              ),
                                              20.widthBox,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  '${art_controller.Course_details_model_var!.owner!.name!}'
                                                      .text
                                                      .black
                                                      .fontFamily(bold)
                                                      .size(12)
                                                      .make(),
                                                  '${art_controller.Course_details_model_var!.owner!.specialization!}'
                                                      .text
                                                      .black
                                                      .fontFamily(medium)
                                                      .size(12)
                                                      .make(),
                                                ],
                                              ).box.height(40).make(),
                                            ],
                                          ),
                                          CustomButton(
                                            text: communication.tr,
                                            textColor: whiteColor.value,
                                            backgroundColor: blackColor.value,
                                            borderColor: blackColor.value,
                                            onPressed: () {
                                              // Get.to(
                                              //   () => BuyTheCourseScreen(),
                                              //   transition: Transition.rightToLeft,
                                              // );
                                            },
                                          )
                                              .box
                                              .height(45)
                                              .width(context.screenWidth / 4)
                                              .make(),
                                        ],
                                      )
                                    : SizedBox(),
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
