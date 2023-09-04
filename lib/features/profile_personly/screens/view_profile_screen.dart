import 'package:antaji_app/features/artists/screens/portfolio/user_video_screen.dart';
import 'package:antaji_app/features/profile_personly/controller/profile_controller.dart';
import 'package:antaji_app/features/profile_personly/screens/complete_my_profile_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../constant/const.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  var prof_controller = Get.put(ProfileController());
  late VideoPlayerController _controller_video;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await prof_controller.getProfDetails('profile');
    });
    if (prof_controller.profile_model_var != null) {
      if (prof_controller.profile_model_var!.video != null) {
        _controller_video = VideoPlayerController.networkUrl(
            Uri.parse('${prof_controller.profile_model_var!.video!}'))
          ..initialize().then((_) {
            if (mounted) {
              setState(() {});
            }
          });
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: Obx(
        () => prof_controller.isDataProfileLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : prof_controller.profile_model_var == null
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
                        Stack(
                          children: [
                            prof_controller.profile_model_var!.coverPhoto ==
                                    null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AddACoverPhoto.tr.text
                                          .fontFamily(bold)
                                          .size(24)
                                          .color(whiteColor.value)
                                          .make()
                                    ],
                                  )
                                    .box
                                    .width(context.screenWidth)
                                    .height(context.screenHeight / 3)
                                    .color(blackColor.value)
                                    .make()
                                : Image.network(
                                    '${prof_controller.profile_model_var!.coverPhoto!}',
                                    width: context.screenWidth,
                                    height: context.screenHeight / 3,
                                    fit: BoxFit.fill,
                                  ),
                            Positioned(
                              bottom: 20,
                              // right: 12,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: whiteColor.value,
                                      radius: context.screenWidth / 6.9,
                                      backgroundImage: prof_controller
                                              .profile_model_var!
                                              .personalPhoto!
                                              .isEmpty
                                          ? NetworkImage(
                                              'https://antaji.metricshop.net/dashboard/app-assets/images/4367.jpg')
                                          : NetworkImage(
                                              '${prof_controller.profile_model_var!.personalPhoto!}'),
                                    ),
                                    10.widthBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            15.heightBox,
                                            Row(
                                              children: [
                                                '${prof_controller.profile_model_var!.name!}'
                                                    .text
                                                    .fontFamily(bold)
                                                    .color(blackColor.value)
                                                    .size(16)
                                                    .make(),
                                                10.widthBox,
                                                prof_controller
                                                        .profile_model_var!
                                                        .isVerified!
                                                    ? SvgPicture.asset(
                                                        verifyIcon)
                                                    : SizedBox(),
                                              ],
                                            ),
                                            10.heightBox,
                                            'تصوير سينمائي'
                                                .text
                                                .fontFamily(medium)
                                                .color(blackColor.value)
                                                .size(12)
                                                .make(),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              editIcon,
                                              color: whiteColor.value,
                                            ),
                                            10.widthBox,
                                            EditText.tr.text
                                                .fontFamily(medium)
                                                .size(12)
                                                .color(whiteColor.value)
                                                .make(),
                                          ],
                                        )
                                            .box
                                            .width(context.screenWidth / 4)
                                            .height(context.screenHeight / 20)
                                            .color(blackColor.value)
                                            .withRounded(value: 12)
                                            .make()
                                            .onTap(() {
                                          Get.to(
                                            () => CompleteMyProfileScreen(),
                                            transition: Transition.rightToLeft,
                                          );
                                        }),
                                        1.widthBox,
                                      ],
                                    )
                                        .box
                                        .width(context.screenWidth / 1.5)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .width(context.screenWidth)
                                    //  .color(greenColor)
                                    .make(),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                height: context.screenHeight / 2.2,
                                width: context.screenWidth,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.screenHeight / 25,
                                    horizontal: context.screenWidth / 38,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      10.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundColor: whiteColor.value,
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: blackColor.value,
                                                  size: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                            .box
                            .height(context.screenHeight / 2.2)
                            .width(context.screenWidth)
                            //.color(greenColor)
                            .make(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              prof_controller.profile_model_var!.brief == null
                                  ? SizedBox()
                                  : Brief.tr.text
                                      .fontFamily(regular)
                                      .size(16)
                                      .color(blackColor.value)
                                      .make(),
                              20.heightBox,
                              prof_controller.profile_model_var!.brief == null
                                  ? SizedBox()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        '${prof_controller.profile_model_var!.brief!}'
                                            .text
                                            .fontFamily(regular)
                                            .size(14)
                                            .lineHeight(2)
                                            .color(blackColor.value)
                                            .make()
                                      ],
                                    )
                                      .box
                                      .height(context.screenHeight / 6)
                                      .width(context.screenWidth)
                                      .rounded
                                      .padding(EdgeInsets.all(20))
                                      .color(lightColor.value)
                                      .make(),
                              20.heightBox,
                              skillsText.tr.text
                                  .fontFamily(regular)
                                  .size(16)
                                  .color(blackColor.value)
                                  .make(),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: context.height / 18,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 4,
                                ),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      'مصور سينمائي'
                                          .text
                                          .fontFamily(regular)
                                          .size(12)
                                          .color(whiteColor.value)
                                          .make()
                                    ],
                                  )
                                      .box
                                      .height(context.screenHeight / 18)
                                      .width(context.screenWidth / 3)
                                      .withRounded(
                                        value: 24,
                                      )
                                      .padding(EdgeInsets.all(4))
                                      .color(blackColor.value)
                                      .make();
                                },
                              ),
                              20.heightBox,
                              IntroductoryVideo.tr.text
                                  .fontFamily(regular)
                                  .size(16)
                                  .color(blackColor.value)
                                  .make(),
                              20.heightBox,
                              prof_controller.profile_model_var!.video == null
                                  ? SizedBox()
                                  : Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          child: _controller_video
                                                  .value.isInitialized
                                              ? AspectRatio(
                                                  aspectRatio: _controller_video
                                                      .value.aspectRatio,
                                                  child: VideoPlayer(
                                                      _controller_video),
                                                )
                                              : CircularProgressIndicator(),
                                        )
                                            .box
                                            .height(context.screenHeight / 3.5)
                                            .width(context.screenWidth)
                                            .color(lightColor.value)
                                            .rounded
                                            .make(),
                                        CircleAvatar(
                                          radius: context.screenWidth / 14,
                                          backgroundColor: Color(0xFF707070),
                                          child: SvgPicture.asset(
                                            video_play_icon,
                                            width: context.screenWidth / 14,
                                            height: context.screenHeight / 28,
                                          ).onTap(() {
                                            Get.to(
                                              () => UserVideoScreen(
                                                url: prof_controller
                                                    .profile_model_var!.video!,
                                                uuidUser: '',
                                                uuidVideo: '',
                                              ),
                                              transition:
                                                  Transition.rightToLeft,
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                              20.heightBox,
                              LocationOnTheMap.tr.text
                                  .fontFamily(regular)
                                  .size(16)
                                  .color(blackColor.value)
                                  .make(),
                              20.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    LightLocationIcon,
                                    color: blackColor.value,
                                  ),
                                  10.widthBox,
                                  'الرياض ، شارع الملك عبدالله'
                                      .text
                                      .fontFamily(regular)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                ],
                              )
                                  .box
                                  .height(context.screenHeight / 15)
                                  .width(context.screenWidth)
                                  .color(lightColor.value)
                                  .padding(EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ))
                                  .rounded
                                  .make()
                                  .onTap(() {}),
                              20.heightBox,
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
